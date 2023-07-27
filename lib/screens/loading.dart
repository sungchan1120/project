import 'package:flutter/material.dart';
import 'package:project/data/my_location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
    fetchData();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longgitude3 = myLocation.longitude2;
    print(latitude3);
    print(longgitude3);
  }

  void fetchData() async {
    http.Response response = await http.get(Uri.parse(
        'https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1'));
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var myJson = jsonDecode(jsonData)['weather'][0]['description'];
      print(myJson);

      var wind = jsonDecode(jsonData)['windy']['speed'];
      print(wind);
    } else {
      print(response.statusCode);
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
          child: Text('get my location'),
        ),
      ),
    );
  }
}
