import 'package:flutter/material.dart';
import 'package:project/data/my_location.dart';
import 'package:project/data/network.dart';
import 'package:project/screens/weather_screen.dart';

const apiKey = '848066366a50df17d81b4e2340b02969'; //API키

class Loading extends StatefulWidget {
  final String city; // 도시명 //drawer에서 전달해주는 정보
  final double latitude; // 위도
  final double longitude; // 경도

  Loading({
    required this.city,
    required this.latitude,
    required this.longitude,
  });

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    MyLocation myLocation = MyLocation();
    myLocation.latitude2 = widget.latitude;
    myLocation.longitude2 = widget.longitude;

    Network network = Network(
      'https://api.openweathermap.org/data/2.5/weather?lat=${widget.latitude}&lon=${widget.longitude}&appid=$apiKey&units=metric',
    );

    try {
      var weatherData = await network.getJsonData();
      print('Weather Data for ${widget.city}: $weatherData');
      //위도,경도 => 로딩 => API호출 => json데이터 호출 => weatherscreen 전달 => ui구성
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return WeatherScreen(
          parseWeatherData: weatherData,
        );
      }));
    } catch (e) {
      print('Error getting weather data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.bottomRight, // 텍스트를 오른쪽 아래에 배치
        child: Padding(
          padding: const EdgeInsets.all(16.0), // 여백 조절
          child: ElevatedButton(
            onPressed: () {
              getLocation();
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent, // 배경 없음
              shadowColor: Colors.transparent, // 그림자 없음
            ),
            child: Text(
              '${widget.city}의 날씨를 가져오는 중입니다...',
              style: TextStyle(
                fontSize: 50,
                color: Colors.black, // 글씨 색상
              ),
            ),
          ),
        ),
      ),
    );
  }
}
