import 'package:flutter/material.dart';
import 'package:project/data/my_location.dart';
import 'package:project/data/network.dart';
import 'package:project/screens/weather_screen.dart';

const apiKey = '848066366a50df17d81b4e2340b02969'; // 여기에 사용할 API 키를 넣어주세요

class Loading extends StatefulWidget {
  final String city; // 도시명
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
      'https://api.openweathermap.org/data/2.5/air-pollution?lat=${widget.latitude}&lon=${widget.longitude}&appid=$apiKey',
    );

    try {
      var weatherData = await network.getJsonData();
      print('Weather Data for ${widget.city}: $weatherData');

      var airData = await network.getAirData();
      print('Air Data for ${widget.city}: $airData');

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
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            getLocation();
          },
          child: Text('Get Weather for ${widget.city}'),
        ),
      ),
    );
  }
}
