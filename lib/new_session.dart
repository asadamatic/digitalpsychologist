import 'dart:math';

import 'package:digitalpsychologist/DataModels/session.dart';
import 'package:digitalpsychologist/new_session_controller.dart';
import 'package:digitalpsychologist/session_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeleton_text/skeleton_text.dart';

class NewSessions extends StatefulWidget {
  @override
  _NewSessionsState createState() => _NewSessionsState();
}

class _NewSessionsState extends State<NewSessions> {
  NewSessionController _newSessionController = Get.put(NewSessionController());
  SessionController _sessionController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Session'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
             Obx(() {
            if (!_newSessionController.isLoading.value) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Your stress level is ',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline6),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _newSessionController.stressLevel.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ],
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Wait while your stress level is being evaluated...',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SkeletonAnimation(
                      borderRadius: BorderRadius.circular(10.0),
                      shimmerColor: Colors.white54,
                      child: Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width * 0.10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[300]),
                      )),
                ),
              ],
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: () {
          _sessionController.addNewSession(Session(
              time: DateTime.now(),
              stressLevel: _newSessionController.stressLevel.value));
          Get.back();
        },
      ),
    );
  }
}
