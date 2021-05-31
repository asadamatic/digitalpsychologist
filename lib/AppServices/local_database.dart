import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  static const _databaseName = 'final_app_database.db';
  static Database _database;

  Future<Database> get database async {
    if (_database == null) {
      return await initializeDocumentsTable();
    } else {
      return _database;
    }
  }

  initializeDocumentsTable() async {
    return await openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, version) {
        return _createDb(db);
      },
      version: 1,
    );
  }

  static void _createDb(Database db) {
    db.execute(
        "CREATE TABLE sessions(time TEXT, stressLevel INTEGER)");
  }
}
