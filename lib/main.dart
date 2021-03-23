import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home.dart';
import 'screens/login.dart';
import 'screens/signup.dart';
import 'models/authentication.dart';
import 'screens/logout.dart';
import 'package:flutter_app/routes.dart';
void main()=>runApp(MyApp());

class MyApp extends StatefulWidget {
  @override

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
         value:Authentication(),
        ),
      ],
      child: MaterialApp(

        title: 'Login App',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: Login(),

        /*routes: Routes.getRoutes(context),
        initialRoute: Home.routeName,*/

        routes: {
          Logout.routName: (context)=> Login(),
          SignupScreen.routeName: (ctx)=> SignupScreen(),
          Login.routeName:(ctx)=> Login(),
          Home.routeName:(ctx)=> Home(),
        },
      ),
    );
  }
}

