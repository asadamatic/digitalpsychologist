import 'package:digitalpsychologist/one_time_screen_wrapper.dart';
import 'package:digitalpsychologist/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  final Function selectScreen;
  SplashScreen({Key key, this.selectScreen}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // TODO: Uncomment this for production
    Future.delayed(Duration(seconds: 3), () {
      print('Done');
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (builder) => OneTimeScreenWrapper()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.amber.shade700,
        body: Container(
          alignment: Alignment.center,
          // color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Image(
                alignment: Alignment.center,
                image: AssetImage('assets/splashlogo.png'),
                height: 100.0,
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 35),
                child: Text('Digital Psychologist',
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
