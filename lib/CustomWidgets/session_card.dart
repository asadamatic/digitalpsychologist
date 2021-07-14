import 'package:digitalpsychologist/DataModels/session.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class SessionCard extends StatelessWidget {
  final int index;
  final Session session;
  SessionCard({this.index, this.session});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
      margin:
          EdgeInsets.symmetric(horizontal: 12) + EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: session.stressLevel < 13
            ? Colors.green
            : session.stressLevel < 26
                ? Colors.amber
                : Colors.red,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Session ${index + 1}',
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: session.stressLevel < 13 || session.stressLevel > 26
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              Text(
                'Time: ${DateFormat.jm().format(session.time)} | Date: ${DateFormat.yMMMd().format(session.time)}',
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: session.stressLevel < 13 || session.stressLevel > 26
                      ? Colors.white70
                      : Colors.black45,
                ),
              ),
            ],
          ),
          CircularStepProgressIndicator(
            totalSteps: 40,
            currentStep: session.stressLevel,
            stepSize: 6,
            selectedColor: session.stressLevel < 13
                ? Colors.green.shade900
                : session.stressLevel < 26
                    ? Colors.yellow.shade900
                    : Colors.red.shade900,
            unselectedColor: Colors.transparent,
            padding: 0,
            width: 40,
            height: 40,
            selectedStepSize: 6,
            roundedCap: (_, __) => true,
            child: Center(
              child: Text(
                session.stressLevel.toString(),
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: session.stressLevel < 13 || session.stressLevel > 26
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
