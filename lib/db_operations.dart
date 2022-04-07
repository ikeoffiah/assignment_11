import 'package:db_test/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBOperations {
  Database _database;

  DBOperations(this._database);

  Future<void> insertRecord(String first_name, String last_name, String email,
      String password) async {
    Map<String, Object> userMap = {
      "id": DateTime.now().millisecond,
      "first_name": first_name,
      "last_name": last_name,
      "email": email,
      "password": password
    };

    await _database.insert(
      'users',
      userMap,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<User>> users() async {
    // Get a reference to the database.

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await _database.query('users');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return User(
          id: maps[i]['id'],
          first_name: maps[i]['first_name'],
          last_name: maps[i]['last_name'],
          email: maps[i]['last_name'],
          password: maps[i]['password']);
    });
  }
}
