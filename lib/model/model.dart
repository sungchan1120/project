import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_animation/weather_animation.dart';

class Model {
  Widget? getWeatherBackground(int condition) {
    //condition값에 따라 바뀌는 뒷 배경
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
    //영어로 오는 API를 한글로 매핑
    final Map<String, String> descriptionMap = {
      'thunderstorm with light rain': '천둥번개와 가벼운 비',
      'thunderstorm with rain': '천둥번개와 비',
      'thunderstorm with heavy rain': '천둥번개와 강한 비',
      'light thunderstorm': '가벼운 천둥번개',
      'thunderstorm': '천둥번개',
      'heavy thunderstorm': '강한 천둥번개',
      'ragged thunderstorm': '요란한 천둥번개',
      'thunderstorm with light drizzle': '천둥번개와 가벼운 이슬비',
      'thunderstorm with drizzle': '천둥번개와 이슬비',
      'thunderstorm with heavy drizzle': '천둥번개와 강한 이슬비',
      'light intensity drizzle': '가벼운 이슬비',
      'drizzle': '이슬비',
      'heavy intensity drizzle': '강한 이슬비',
      'light intensity drizzle rain': '가벼운 이슬비 비',
      'drizzle rain': '이슬비 비',
      'heavy intensity drizzle rain': '강한 이슬비 비',
      'shower rain and drizzle': '소나기 비와 이슬비',
      'heavy shower rain and drizzle': '강한 소나기 비와 이슬비',
      'shower drizzle': '소나기 이슬비',
      'light rain': '가벼운 비',
      'moderate rain': '보통 비',
      'heavy intensity rain': '강한 비',
      'very heavy rain': '매우 강한 비',
      'extreme rain': '극한 비',
      'rain': '비',
      'freezing rain': '얼어붙는 비',
      'light intensity shower rain': '가벼운 소나기 비',
      'shower rain': '소나기 비',
      'heavy intensity shower rain': '강한 소나기 비',
      'ragged shower rain': '요란한 소나기 비',
      'light snow': '가벼운 눈',
      'snow': '눈',
      'heavy snow': '강한 눈',
      'sleet': '진눈개비',
      'light shower sleet': '가벼운 소나기 진눈개비',
      'shower sleet': '소나기 진눈개비',
      'light rain and snow': '가벼운 비와 눈',
      'rain and snow': '비와 눈',
      'light shower snow': '가벼운 소나기 눈',
      'shower snow': '소나기 눈',
      'heavy shower snow': '강한 소나기 눈',
      'mist': '안개',
      'haze': '약간의 안개',
      'scattered clouds': '구름',
      'overcast clouds': '흐린 구름',
      'few clouds': '약간의 구름',
      'broken clouds': '부서진 구름',
      'clear sky': '맑음',
      // 다른 날씨에 대한 매핑 추가
      // 다른 날씨에 대한 매핑 추가
    };

    return descriptionMap[englishDescription] ?? englishDescription;
  }

  Widget? getWeatherIcon(int condition) {
    //condition 값에 따라 바뀌는 날씨 아이콘
    if (condition < 200) {
      return SvgPicture.asset(
        'assets/images/colud_lightning.svg',
        width: 120,
        height: 120,
      );
    } else if (condition < 600) {
      return SvgPicture.asset(
        'assets/images/cloud_rain.svg',
        width: 120,
        height: 120,
      );
    } else if (condition < 700) {
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
  //condition값에 따라 바뀌는 추천 멘트.
  if (condition < 233) {
    return Text('천둥이 칠것 같아요⚡️🌩️⛈️!',
        style: GoogleFonts.lato(fontSize: 25, color: Colors.white));
  } else if (condition < 531) {
    return Text('비가 내리니 우산☔️을 챙기는걸 권장해요🌧️!',
        style: GoogleFonts.lato(fontSize: 25, color: Colors.white));
  } else if (condition == 800) {
    return Text('날씨가 맑은데 운동한번 어떤가요?☀️',
        style: GoogleFonts.lato(fontSize: 25, color: Colors.white));
  } else if (condition <= 804) {
    return Text('구름이 껴있네요..!',
        style: GoogleFonts.lato(fontSize: 25, color: Colors.white));
  }
  return Text("Weather icon not available",
      style: GoogleFonts.lato(fontSize: 25, color: Colors.white));
}
