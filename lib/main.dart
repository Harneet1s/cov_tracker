import 'package:covtracker/Splash_Screen.dart';
import 'package:covtracker/views/Navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:covtracker/global.dart';
import 'constant.dart';



void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,

          textTheme: TextTheme(
            body1: TextStyle(color: kBodyTextColor),
          )),
      home: SplashScreen(),
          routes: <String, WidgetBuilder>{
            '/Navigation': (BuildContext context) => new Navigation()
          }
          );
  }
}

