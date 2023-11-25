import 'package:geolocator/geolocator.dart';

class MyLocation {
  late double latitude2;
  late double longitude2;

  Future<void> getMyCurrentLocation() async {
    try {
      //에러를 대비해서 try/catch 구문 사용
      LocationPermission permission =
          await Geolocator.requestPermission(); //비동기 처리 위치 권한 요청
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.reduced);
      latitude2 = position.latitude;
      longitude2 = position.longitude;
    } catch (e) {
      print('인터넷 연결 문제');
    }
  }
}
