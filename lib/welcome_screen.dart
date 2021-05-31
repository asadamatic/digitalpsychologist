import 'package:animated_text/animated_text.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {

  final Function selectScreen;
  WelcomeScreen({Key key, this.selectScreen}) : super(key: key);
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              height: 150.0,
              child: AnimatedText(
                alignment: Alignment.centerLeft,
                speed: Duration(milliseconds: 1000),
                controller: AnimatedTextController.loop,
                displayTime: Duration(milliseconds: 1000),
                wordList: ['Stress', 'Treatment', 'Simplified'],
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 48.0,
                    fontWeight: FontWeight.w700),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 12.0, left: 12.0, top: 12.0, bottom: 24.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                ),

                  child: Text('Get Started'),
                  onPressed: () => widget.selectScreen()
              ),
            ),
          ],
        ));
  }
}
