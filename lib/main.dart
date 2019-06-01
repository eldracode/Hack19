import 'dart:math';

import 'package:flutter/material.dart';
import 'splash_screen/splash.dart';
import 'package:flutter/services.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return new MaterialApp(
      theme: ThemeData(
        primaryColorDark: Colors.black,
        //accentColor: Colors.black,
        //primarySwatch: Colors.black,
      ),
      // darkTheme: ThemeData(brightness: Brightness.dark),
      title: 'Flutter wall',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
