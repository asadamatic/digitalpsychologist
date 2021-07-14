import 'package:digitalpsychologist/one_time_screen_wrapper.dart';
import 'package:digitalpsychologist/splash_screen.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  void selectScreen() async {}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: Future.delayed(Duration(seconds: 2)),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashScreen();
        } else {
          return OneTimeScreenWrapper();
        }
      },
    );
  }
}
