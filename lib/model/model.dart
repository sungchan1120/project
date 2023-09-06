import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class Model {
  Widget? getWeatherIcon(int condition) {
    if (condition < 300) {
      return SvgPicture.asset(
        'assets/images/colud_lightning.svg',
      );
    } else if (condition < 600) {
      return SvgPicture.asset(
        'assets/images/colud_snow_alt.svg',
      );
    } else if (condition == 800) {
      return SvgPicture.asset(
        'assets/images/sun.svg',
      );
    } else if (condition <= 804) {
      return SvgPicture.asset(
        'assets/images/cloud_sun.svg',
      );
    }
    return Text("Weather icon not available");
  }
}
