import 'package:geolocator/geolocator.dart';

class MyLocation {
  late double latitude2;
  late double longitude2;

  Future<void> getMyCurrentLocation() async {
    try {
      LocationPermission permission =
          await Geolocator.requestPermission(); //비동기 처리
      Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude2 = position.latitude;
      longitude2 = position.longitude;
      print(latitude2); //위도,경도 콘솔 창에 출력
      print(longitude2);
    } catch (e) {
      print('인터넷 연결 문제');
    }
  }
}
