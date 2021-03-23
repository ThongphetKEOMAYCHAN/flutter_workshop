
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/screens/home.dart';
import 'package:flutter_app/screens/logout.dart';
class Routes{
  static const String home = Home.routeName;
  static const String logout = Logout.routName;
  static getRoutes(BuildContext context){
    return{
      home:(context) => Home(),
      logout:(context) => Logout()
    };
  }
}