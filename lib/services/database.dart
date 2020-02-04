import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';



class DatabaseService {

  Database _database; 

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await init();
    return _database;
  }

  // Open the database and store the reference.
  Future<Database> init() async{
    print("Database starting..");
    String path =  await getDatabasesPath();
    print("Database gotten");
    return openDatabase(join(path, 'flutter.db'));
  }

}
