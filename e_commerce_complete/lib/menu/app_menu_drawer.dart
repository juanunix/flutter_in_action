import 'package:flutter/material.dart';

class AppMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(),
          ListTile(
            title: Text("hello"),
          ),
          ListTile(
            title: Text("hello 2"),
          ),
        ],
      ),
    );
  }
}
