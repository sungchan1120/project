import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  final String url;
  final String url2;
  Network(this.url, this.url2);
  // 첫 번째 URL에서 JSON 데이터를 가져오기 위한 비동기 함수

  Future<dynamic> getJsonData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }

  // HTTP 응답 상태 코드가 200인지 확인
  Future<dynamic> getAirData() async {
    http.Response response = await http.get(Uri.parse(url2));
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }
}
