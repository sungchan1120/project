import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

class Model {
  Widget? getWeatherBackground(int condition) {
    if (condition < 300) {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      );
    } else if (condition < 600) {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      );
    } else if (condition == 800) {
      return Container(color: Colors.blue);
    } else if (condition <= 804) {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.green],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      );
    }
    // 기본 배경: 검은색 배경
    return Container(
      color: Colors.black,
    );
  }

  Widget? getWeatherIcon(int condition) {
    if (condition < 300) {
      return SvgPicture.asset(
        'assets/images/colud_lightning.svg',
        width: 120,
        height: 120,
      );
    } else if (condition < 600) {
      return SvgPicture.asset(
        'assets/images/sun_fill.svg',
        width: 120,
        height: 120,
      );
    } else if (condition == 800) {
      return SvgPicture.asset(
        'assets/images/sun_fill.svg',
        width: 120,
        height: 120,
      );
    } else if (condition <= 804) {
      return SvgPicture.asset(
        'assets/images/cloud_sun.svg',
        width: 120,
        height: 120,
      );
    }
    return Text("Weather icon not available");
  }
}

Widget? getweatherText(int condition) {
  if (condition < 300) {
    return Text('good');
  } else if (condition < 600) {
    return Text(
      'goodd',
    );
  } else if (condition == 800) {
    return Text('gooddd');
  } else if (condition <= 804) {
    return Text('goodddd');
  }
  return Text("Weather icon not available");
}
