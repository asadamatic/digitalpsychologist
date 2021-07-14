import 'package:digitalpsychologist/AppServices/local_database.dart';
import 'package:digitalpsychologist/AppServices/sessions_table.dart';
import 'package:digitalpsychologist/DataModels/session.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class SessionController extends GetxController {
  RxList sessions = <Session>[].obs;

  SessionController() {
    getSessions();
  }

  getSessions() async {
    sessions.value = await SessionsTable().getSessions();
  }

  addSession(Session session) async {
    await SessionsTable().insertSession(session);
    sessions.add(session);
    update();
  }
}
