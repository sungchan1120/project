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

  String getKoreanDescription(String englishDescription) {
    final Map<String, String> descriptionMap = {
      'rain': '비',
      'snow': '눈',
      'clear sky': '맑음',
      'few clouds': '구름조금',
      // 다른 날씨에 대한 매핑 추가
    };

    return descriptionMap[englishDescription] ?? englishDescription;
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
    return Text('비가 올수 있으니 조심하세요');
  } else if (condition < 600) {
    return Text(
      '눈이 올수도 있어요',
    );
  } else if (condition == 800) {
    return Text('날씨 완전 좋음');
  } else if (condition <= 804) {
    return Text('구름낀 하늘이라....');
  }
  return Text("Weather icon not available");
}
