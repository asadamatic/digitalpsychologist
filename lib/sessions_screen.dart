import 'package:digitalpsychologist/AppServices/session_controller.dart';
import 'package:digitalpsychologist/CustomWidgets/session_card.dart';
import 'package:digitalpsychologist/new_session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SessionsScreen extends StatelessWidget {

  SessionController _sessionController = Get.put(SessionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sessions'),
      ),
      body: ListView.builder(
          itemCount: _sessionController.sessions?.length ?? 0,
          itemBuilder: (context, index){

            return SessionCard(index: index, session: _sessionController.sessions[index],);
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NewSessions()))
      ),
    );
  }
}


