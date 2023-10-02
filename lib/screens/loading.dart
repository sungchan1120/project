import 'package:flutter/material.dart';
import 'package:project/data/my_location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:project/data/network.dart';
import 'package:project/screens/weather_screen.dart';

const apikey = '848066366a50df17d81b4e2340b02969'; // 날씨 api,const사용은 불변

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late double latitude3; //위도 3
  late double longgitude3; //경도 3
  @override
  void initState() {
    // setstate로 생명주기
    super.initState();
    getLocation();
  }

  void getLocation() async {
    // 비동기 처리
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation(); // 현재 위치를 가져옴
    latitude3 = myLocation.latitude2;
    longgitude3 = myLocation.longitude2;
    print(latitude3); //콘솔에 위도 경도 출력
    print(longgitude3);
    //날씨,공기 품질 데이터를 가져오기 위한 네트워크 요청
    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longgitude3&appid=$apikey&units=metric',
        'https://api.openweathermap.org/data/2.5/air-pollution?lat=$latitude3&lon=$longgitude3&appid=$apikey');

    var weatherData = await network.getJsonData(); //날씨 데이터 가져오기
    print(weatherData);

    var airData = await network.getAirData();
    print(airData);
    // 날씨 화면으로 전달
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen(
        parseWeatherData: weatherData,
      );
    }));
  }

  // void fetchData() async {

  //     var myJson = parsingData['weather'][0]['description'];
  //     print(myJson);
  //     var wind = parsingData(jsonData)['windy']['speed'];
  //     print(wind);
  //   } else {
  //     print(response.statusCode);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            getLocation();
          },
          child: Text('get my location'),
        ),
      ),
    );
  }
}
