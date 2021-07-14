import 'package:digitalpsychologist/sessions_screen.dart';
import 'package:digitalpsychologist/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OneTimeScreenWrapper extends StatefulWidget {
  @override
  _OneTimeScreenWrapperState createState() => _OneTimeScreenWrapperState();
}

class _OneTimeScreenWrapperState extends State<OneTimeScreenWrapper> {
  void selectScreen() async {
    setState(() {
      setVisitingValue();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: getVisitingValue(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == true) {
            return SessionsScreen();
          } else {
            return WelcomeScreen(
              selectScreen: selectScreen,
            );
          }
        } else {
          return Scaffold();
        }
      },
    );
  }
}

Future<bool> getVisitingValue() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('visitWelcomeScreenValue') ?? false;
}

setVisitingValue() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('visitWelcomeScreenValue', true);
}
