import 'package:flutter/material.dart'; //필요한 각종 패키지들
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/screens/drawer.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';
import 'package:project/model/model.dart';
import 'package:weather_animation/weather_animation.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({this.parseWeatherData});
  final dynamic parseWeatherData;
  @override
  WeatherScreenState createState() => WeatherScreenState();
}

class WeatherScreenState extends State<WeatherScreen> {
  Model model = Model();
  String? cityName; //State 클래스에서 사용할 변수 및 메소드들이 정의되어 있음.
  int? temp;
  Widget? background;
  Widget? weatherText;
  Widget? icon;
  String? koreanDes;
  var date = DateTime.now();
  String? des;
  @override
  void initState() {
    super.initState();
    updateData(widget.parseWeatherData);
  }

  void updateData(dynamic weatherData) {
    // 날씨 데이터를 받아와서 UI를 업데이트하는 메소드
    double temp2 = weatherData['main']['temp'];
    int condition = weatherData['weather'][0]['id'];
    des = weatherData['weather'][0]['description'];
    temp = temp2.round();
    cityName = weatherData['name'];
    setState(() {
      background = model.getWeatherBackground(condition);
    });

    setState(() {
      weatherText = getweatherText(condition);
    });

    setState(() {
      koreanDes = model.getKoreanDescription(des!); // 영어에서 한글로 번역
    });

    setState(() {
      icon = model.getWeatherIcon(condition);
    });
    print(temp);
    print(cityName);
  }

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat("h:m a").format(now);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // title: Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: MenuDrawer(),
      body: Container(
        child: Stack(
          children: [
            background ?? Container(),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 150,
                              ),
                              Text(
                                ('$cityName'),
                                style: GoogleFonts.lato(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Row(
                                children: [
                                  TimerBuilder.periodic(
                                    (Duration(minutes: 1)),
                                    builder: (context) {
                                      print('${getSystemTime}');
                                      return Text(
                                        '${getSystemTime()}',
                                        style: GoogleFonts.lato(
                                            fontSize: 16, color: Colors.white),
                                      );
                                    },
                                  ),
                                  Text(
                                    DateFormat(' - EEEE').format(date),
                                    style: GoogleFonts.lato(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  Text(
                                    DateFormat('d MMM, yyy').format(date),
                                    style: GoogleFonts.lato(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ],
                              ),
                              Text(
                                '$temp\u2103',
                                style: GoogleFonts.lato(
                                  fontSize: 85,
                                  height: 0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ]),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Text(
                                      koreanDes ?? '', // 한글 날씨 설명 출력
                                      style: GoogleFonts.lato(
                                        fontSize: 35,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  icon!,
                                  SizedBox(height: 10),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 300),
                                    child: weatherText ??
                                        Text("Weather text not available"),
                                  ),
                                  SizedBox(height: 10),
                                  // Container(
                                  //   margin: EdgeInsets.fromLTRB(0, 0, 0, 300),
                                  //   child: weatherText ??
                                  //       Text("Weather text not available"),
                                  // ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
