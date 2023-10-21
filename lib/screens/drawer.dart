import 'package:flutter/material.dart';
import 'package:project/screens/loading.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenu(context),
      ),
    );
  }

  List<Widget> buildMenu(BuildContext context) {
    return [
      ListTile(
        title: TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Loading(
                city: '서울',
                latitude: 37.5665, // 서울의 위도 전달
                longitude: 126.9780, // 서울의 경도 전달
              );
            }));
          },
          child: Text('서울'),
        ),
        onTap: () {},
      ),
      ListTile(
        title: TextButton(
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
    ];
  }
}
