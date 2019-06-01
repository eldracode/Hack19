import "dart:async";
import "package:flutter/material.dart";
import '../ui/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  Widget build(BuildContext build) {
    return Scaffold(
        body: Center(
            child: Image.asset('images/img.png', width: 200, height: 200)));
  }

  startTime() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.push(context, MaterialPageRoute(builder: (builder) => MyApp()));
  }
}
