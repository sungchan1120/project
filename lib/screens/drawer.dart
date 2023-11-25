import 'package:flutter/material.dart';
import 'package:project/screens/loading.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 150,
      child: ListView(
        children: buildMenu(context),
      ),
    );
  }

  List<Widget> buildMenu(BuildContext context) {
    return [
      ListTile(
        title: ElevatedButton(
          style: ElevatedButton.styleFrom(minimumSize: Size(1, 70)),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              //loding으로 위치 전달
              return Loading(
                city: '서울',
                latitude: 37.5665, // 서울의 위도 전달
                longitude: 126.9780, // 서울의 경도 전달
              );
            }));
          },
          child: Text(
            '서울',
          ),
        ),
        onTap: () {},
      ),
      SizedBox(
        height: 15,
      ),
      ListTile(
        title: ElevatedButton(
          style: ElevatedButton.styleFrom(minimumSize: Size(1, 70)),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Loading(
                city: '부산',
                latitude: 35.1796, // 부산의 위도 전달
                longitude: 129.0756, // 부산의 경도 전달
              );
            }));
          },
          child: Text('부산'),
        ),
        onTap: () {},
      ),
      SizedBox(
        height: 15,
      ),
      ListTile(
        title: ElevatedButton(
          style: ElevatedButton.styleFrom(minimumSize: Size(1, 70)),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Loading(
                city: '인천',
                latitude: 37.45639, // 부산의 위도 전달
                longitude: 126.70528, // 부산의 경도 전달
              );
            }));
          },
          child: Text('인천'),
        ),
        onTap: () {},
      ),
      SizedBox(
        height: 15,
      ),
      ListTile(
        title: ElevatedButton(
          style: ElevatedButton.styleFrom(minimumSize: Size(1, 70)),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Loading(
                city: '대구',
                latitude: 35.87222, // 대구의 위도 전달
                longitude: 128.60250, // 대구의 경도 전달
              );
            }));
          },
          child: Text('대구'),
        ),
        onTap: () {},
      ),
      SizedBox(
        height: 15,
      ),
      ListTile(
        title: ElevatedButton(
          style: ElevatedButton.styleFrom(minimumSize: Size(1, 70)),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Loading(
                city: '광주',
                latitude: 35.15972, // 광주의 위도 전달
                longitude: 126.85306, // 광주의 경도 전달
              );
            }));
          },
          child: Text('광주'),
        ),
        onTap: () {},
      ),
      SizedBox(
        height: 15,
      ),
      ListTile(
        title: ElevatedButton(
          style: ElevatedButton.styleFrom(minimumSize: Size(1, 70)),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Loading(
                city: '대전',
                latitude: 36.35111, // 대전의 위도 전달
                longitude: 127.38500, // 대전의 경도 전달
              );
            }));
          },
          child: Text('대전'),
        ),
        onTap: () {},
      ),
    ];
  }
}
