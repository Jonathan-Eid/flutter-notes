import '../models/notes.dart';
import './database.dart';
import 'package:sqflite/sqflite.dart';


class NotesService{


  Database _database; 

    /**/


  addNote(int id, String header, String content, DateTime date) {

    Notes note = new Notes(id: id, header: header, content: content, date: date);
    insertNote(note);

  }


  Future<void> insertNote(Notes note) async {

    final Database db = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'notes',
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


    Future<List<Notes>> retrieveCurrentMonthsNotes() async {
    int cur_month = DateTime.now().month;
    int cur_year = DateTime.now().year;

    int month_start = DateTime(cur_year, cur_month).millisecondsSinceEpoch;


    final db = await database;
    List<Notes> notesList = [];
    List<Map> maps = await db.query('Notes', where: 'date > $month_start');
    
    if (maps.length > 0) {
      maps.forEach((map) {
        notesList.add(Notes.fromMap(map));
      });
    }
    return notesList; 
  }


  Future<Notes> retrieveNote(id) async {
    final db = await database;
    List<Notes> notesList = [];
    List<Map> maps = await db.query('Notes', where: id);

    if (maps.length > 0) {
      return Notes.fromMap(maps[0]);
    }
   
  }

  Future<List<Notes>> retrieveNotes() async {
    final db = await database;
    List<Notes> notesList = [];
    List<Map> maps = await db.query('Notes',
        columns: ['_id', 'header', 'content', 'date']);
    if (maps.length > 0) {
      maps.forEach((map) {
        notesList.add(Notes.fromMap(map));
      });
    }
    return notesList;
  }

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await init();
    return _database;
  }

  // Open the database and store the reference.
  Future<Database> init() async{
    Database database = await DatabaseService().database;
    database.execute(
      "CREATE TABLE IF NOT EXISTS notes(id INTEGER PRIMARY KEY, header TEXT, content TEXT, date INT)",
    );
    return database;
  }

}

