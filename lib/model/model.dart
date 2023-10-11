import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      '	thunderstorm with light rain': '천둥번개',
      '	thunderstorm with rain': '천둥번개',
      '	thunderstorm with heavy rain': '천둥번개',
      '	light thunderstorm': '천둥번개',
      '	thunderstorm': '천둥번개',
      '	heavy thunderstorm': '천둥번개',
      '	ragged thunderstorm': '천둥번개',
      '	thunderstorm with light drizzle': '천둥번개',
      '	thunderstorm with drizzle': '천둥번개',
      '	thunderstorm with heavy drizzle': '천둥번개',
      // 천둥번개
      '	light intensity drizzle': '이슬비',
      '	drizzle': '이슬비',
      '	heavy intensity drizzle': '이슬비',
      '	light intensity drizzle rain': '이슬비',
      '	drizzle rain': '이슬비',
      '	heavy intensity drizzle rain': '이슬비',
      '	shower rain and drizzle': '이슬비',
      '	heavy shower rain and drizzle': '이슬비',
      '	shower drizzle': '이슬비',
      //이슬비
      '	light rain': '비',
      '	moderate rain': '비',
      '	heavy intensity rain': '비',
      '	very heavy rain': '비',
      '	extreme rain': '비',
      'rain': '비',
      '	freezing rain': '비',
      'light intensity shower rain': '비',
      '	shower rain': '비',
      '	heavy intensity shower rain': '비',
      '	ragged shower rain': '비',
      //비
      '	light snow': '눈',
      '	snow': '눈',
      '	heavy snow': '눈',
      '	sleet': '눈',
      '	light shower sleet': '눈',
      '	shower sleet': '눈',
      '	light rain and snow': '눈',
      'rain and snow': '눈',
      '	light shower snow': '눈',
      '	shower snow': '눈',
      '	heavy shower snow': '눈',
      //눈
      'scattered clouds:': '구름',
      'overcast clouds': '구름',
      'few clouds': '구름',
      'broken clouds': '구름',
      //구름
      'clear sky': '맑음',
      //맑음
      // 다른 날씨에 대한 매핑 추가
    };

    return descriptionMap[englishDescription] ?? englishDescription;
  }

  Widget? getWeatherIcon(int condition) {
    if (condition < 200) {
      return SvgPicture.asset(
        'assets/images/colud_lightning.svg',
        width: 120,
        height: 120,
      );
    } else if (condition < 500) {
      return SvgPicture.asset(
        'assets/images/cloud_rain.svg',
        width: 120,
        height: 120,
      );
    } else if (condition < 600) {
      return SvgPicture.asset(
        'assets/images/cloud_snow_alt.svg',
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
  if (condition < 233) {
    return Text('천둥이 칠것 같아요!',
        style: GoogleFonts.lato(fontSize: 25, color: Colors.white));
  } else if (condition < 531) {
    return Text('비가 내리니 우산을 챙기는걸 권장해요!',
        style: GoogleFonts.lato(fontSize: 25, color: Colors.white));
  } else if (condition == 800) {
    return Text('날씨가 맑은데 운동한번 어떤가요?',
        style: GoogleFonts.lato(fontSize: 25, color: Colors.white));
  } else if (condition <= 804) {
    return Text('구름낀 하늘이라....',
        style: GoogleFonts.lato(fontSize: 25, color: Colors.white));
  }
  return Text("Weather icon not available",
      style: GoogleFonts.lato(fontSize: 25, color: Colors.white));
}
