import 'package:flutter/material.dart';
import '../app_drawer.dart';
class Logout extends StatelessWidget {
 //static const routeName = '/logout';
 static const String routName = '/logout';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    drawer: AppDrawer(),
    appBar: AppBar(
      title: Text('Logout'),
    ),
      body: Center(
        child: Text("Exit"),
      ),
    );
  }
}
