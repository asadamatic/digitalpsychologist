import 'package:animated_text/animated_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: NetworkImage(
                'https://images.fineartamerica.com/images-medium-large-5/4-stem-cell-derived-nerve-cells-science-photo-library.jpg',
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.amber.shade700.withOpacity(0.6),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 150.0,
              decoration: BoxDecoration(
                color: Colors.amber.shade700.withOpacity(0.75),
                borderRadius: BorderRadius.circular(15),
              ),
              child: AnimatedText(
                alignment: Alignment.center,
                speed: Duration(milliseconds: 1500),
                controller: AnimatedTextController.loop,
                displayTime: Duration(milliseconds: 1000),
                wordList: ['Stress', 'Treatment', 'Simplified'],
                textStyle: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                  color: Colors.black.withOpacity(1),
                ),
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () => widget.selectScreen(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.amber.shade700,
                    ),
                    child: Center(
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ],
    ));
  }
}
