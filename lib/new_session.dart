import 'dart:math';

import 'package:digitalpsychologist/AppServices/session_controller.dart';
import 'package:digitalpsychologist/DataModels/session.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class NewSessions extends StatefulWidget {
  @override
  _NewSessionsState createState() => _NewSessionsState();
}

class _NewSessionsState extends State<NewSessions> {
  final Random random = new Random();

  int stressLevel = 0;

  Future<int> returnStressLevel() {
    return Future.delayed(Duration(seconds: 10))
        .then((value) => random.nextInt(41));
  }

  SessionController _sessionController = Get.find<SessionController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: Text(
          'New Session',
          style: GoogleFonts.quicksand(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
          onPressed: () => _sessionController
              .addSession(
                  Session(time: DateTime.now(), stressLevel: stressLevel))
              .then((val) => Navigator.pop(context)),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<int>(
              future: returnStressLevel(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  stressLevel = snapshot.data;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Your stress level is ',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.quicksand(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 36,
                      ),
                      CircularStepProgressIndicator(
                        totalSteps: 40,
                        currentStep: snapshot.data,
                        stepSize: 20,
                        selectedColor: snapshot.data < 13
                            ? Colors.green
                            : snapshot.data < 26
                                ? Colors.amber
                                : Colors.red,
                        unselectedColor: Colors.grey.shade700,
                        padding: 0,
                        width: 180,
                        height: 180,
                        selectedStepSize: 20,
                        roundedCap: (_, __) => true,
                        child: Center(
                          child: Text(
                            '${((snapshot.data / 40) * 100).toStringAsFixed(1)}%',
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 32,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 36,
                      ),
                      Text(
                        'Recommendation:',
                        style: GoogleFonts.quicksand(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 8),
                        child: Center(
                          child: Text(
                            snapshot.data < 13
                                ? 'Your mind is at a very low stress level right now, no need to panic!'
                                : snapshot.data < 26
                                    ? 'You\'re under mild stress, just take a small nap to releive yourself from the workload stress.'
                                    : 'You\'re under stress, take some rest immediately. In case you don\'t feel better after sleep, take some anti-depressents and take a cup of tea or coffee',
                            style: GoogleFonts.quicksand(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   height: 30,
                    //   width: 30,
                    //   child: CircularProgressIndicator(
                    //     valueColor:
                    //         AlwaysStoppedAnimation(Colors.amber.shade700),
                    //     strokeWidth: 5,
                    //   ),
                    // ),
                    GlowingProgressIndicator(
                      child: Image(
                        image: AssetImage('assets/splashlogo.png'),
                        height: 100.0,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Please wait while your stress level is being evaluated...',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quicksand(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
      floatingActionButton: FutureBuilder(
        future: returnStressLevel(),
        builder: (context, snapshot) => snapshot.hasData
            ? FloatingActionButton(
                backgroundColor: Colors.amber.shade700,
                child: Icon(
                  Icons.done_rounded,
                  size: 32,
                  color: Colors.black,
                ),
                onPressed: () {
                  _sessionController
                      .addSession(Session(
                          time: DateTime.now(), stressLevel: stressLevel))
                      .then((val) => Navigator.pop(context));
                },
              )
            : Container(),
      ),
    );
  }
}
