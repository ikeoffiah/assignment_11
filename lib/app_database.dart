import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDataBase {
  Future<Database> initdb() async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'test.db'),

      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, first_name TEXT, last_name TEXT, email TEXT, password TEXT)',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );

    return database;
  }
}
