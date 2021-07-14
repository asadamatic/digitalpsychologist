import 'dart:math';

import 'package:digitalpsychologist/AppServices/local_database.dart';
import 'package:digitalpsychologist/AppServices/sessions_table.dart';
import 'package:digitalpsychologist/DataModels/session.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class SessionController extends GetxController {

  RxList sessions = <Session>[].obs;
  RxBool isLoading = true.obs;

  final Random random = new Random();
  SessionController(){
    
    getSessions();
  }


  getSessions() async{

    sessions.value = await SessionsTable().getSessions();
  }

  addNewSession(Session newSession) async{
    await SessionsTable().insertSession(newSession);
    sessions.add(newSession);

  }
}
