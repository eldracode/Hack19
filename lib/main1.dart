import "package:flutter/material.dart";
import "splash_screen/splash.dart";
import "package:flutter/services.dart";

import "ui/home.dart";

void main() => runApp(App());

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/HomeScreen': (BuildContext context) => Home(),
      },
    );
  }
}