import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  final String url;
  Network(
    this.url,
  );
  // 첫 번째 URL에서 JSON 데이터를 가져오기 위한 비동기 함수

  Future<dynamic> getJsonData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      //http 상태가 200일때 Json데이터를 문자열로 받아온다.
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }

  // HTTP 응답 상태 코드가 200인지 확인
}
