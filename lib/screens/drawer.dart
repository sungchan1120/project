import 'package:flutter/material.dart';

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
          onPressed: () {},
          child: Text('서울'),
        ),
        onTap: () {},
      ),
    ];
  }
}
