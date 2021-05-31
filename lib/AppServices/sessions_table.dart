import 'package:digitalpsychologist/AppServices/local_database.dart';
import 'package:digitalpsychologist/DataModels/session.dart';
import 'package:sqflite/sqflite.dart';

class SessionsTable {
  String _tableName = 'sessions';

  Future<List<Session>> getSessions() async {
    // Get a reference to the database.
    final Database db = await LocalDatabase().database;

    // Query the table for all The DocumentImages.
    final List<Map<String, dynamic>> dataMap = await db.query(_tableName);

    return List.generate(dataMap.length, (i) {
      return Session(
        time: DateTime.parse(dataMap[i]['time']),
        stressLevel: dataMap[i]['stressLevel'],
      );
    });
  }

  Future<void> insertSession(Session session) async {
    // Get a reference to the database.
    final Database db = await LocalDatabase().database;
    await db.insert(
      _tableName,
      session.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
