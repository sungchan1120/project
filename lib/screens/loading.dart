import 'package:flutter/material.dart';
import 'package:project/data/my_location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:project/data/network.dart';
import 'package:project/screens/weather_screen.dart';

const apikey = '848066366a50df17d81b4e2340b02969';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late double latitude3;
  late double longgitude3;
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longgitude3 = myLocation.longitude2;
    print(latitude3);
    print(longgitude3);

    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longgitude3&appid=$apikey&units=metric');
    var weatherData = await network.getJsonData();
    print(weatherData);
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
