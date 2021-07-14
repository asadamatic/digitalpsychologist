import 'package:digitalpsychologist/AppServices/session_controller.dart';
import 'package:digitalpsychologist/CustomWidgets/session_card.dart';
import 'package:digitalpsychologist/new_session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SessionsScreen extends StatelessWidget {
  SessionController _sessionController = Get.put(SessionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: Text(
          'Sessions',
          style: GoogleFonts.quicksand(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GetBuilder<SessionController>(
        builder: (controller) => _sessionController.sessions.length == 0
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle_rounded,
                      color: Colors.grey,
                      size: 54,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'No sessions yet...\n\nPlease tap the "+" button at the bottom left in order to create a new session',
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 15),
                itemCount: _sessionController.sessions?.length ?? 0,
                itemBuilder: (context, index) {
                  return SessionCard(
                    index: index,
                    session: _sessionController.sessions[index],
                  );
                }),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber.shade700,
          child: Icon(
            Icons.add_rounded,
            color: Colors.black,
            size: 36,
          ),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewSessions()))),
    );
  }
}
