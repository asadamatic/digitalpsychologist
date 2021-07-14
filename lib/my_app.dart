import 'package:digitalpsychologist/routes/app_pages.dart';
import 'package:digitalpsychologist/routes/app_routes.dart';
import 'package:digitalpsychologist/welcome_screen.dart';
import 'package:digitalpsychologist/sessions_screen.dart';
import 'package:digitalpsychologist/splash_screen.dart';
import 'package:digitalpsychologist/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Digital Psychologist',
      debugShowCheckedModeBanner: false,
      // getPages: AppPages.routes,
      // initialRoute: Routes.SESSIONSSCREEN,
      // theme: ThemeData(
      //   brightness: Brightness.dark,
      //   buttonTheme: ButtonThemeData(
      //     buttonColor: Color(0xffFF7D97),
      //     textTheme: ButtonTextTheme.primary,
      //   ),
      //   // primaryColor: Colors.blueGrey[900],
      //   accentColor: Color(0xffFF9EB1),
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: SplashScreen(),
    );
  }
}
