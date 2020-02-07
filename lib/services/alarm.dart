import '../models/alarm.dart';
import './database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:android_intent/android_intent.dart';


class AlarmService{


  Database _database; 

    /**/


  addAlarm(int id, String header, String content, DateTime date) {

    Alarm alarm = new Alarm(id: id, header: header, content: content, date: date);
    insertAlarm(alarm);

  }


  Future<void> insertAlarm(Alarm alarm) async {

    final Database db = await database;

    print(alarm);

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'alarms',
      alarm.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

    Future<void> updateAlarm(Alarm alarm) async {

    final Database db = await database;

    print("UPDATE: " + alarm.header + alarm.content);

    int id = alarm.id;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.update(
      'Alarm',
      alarm.toMap(),
      where: "id = $id",
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


    Future<List<Alarm>> retrieveCurrentMonthsAlarm() async {
    int cur_month = DateTime.now().month;
    int cur_year = DateTime.now().year;

    int month_start = DateTime(cur_year, cur_month).millisecondsSinceEpoch;


    final db = await database;
    List<Alarm> alarmsList = [];
    List<Map> maps = await db.query('Alarm', where: 'date > $month_start', orderBy: 'date DESC');
    
    print(maps);

    if (maps.length > 0) {
      maps.forEach((map) {
        alarmsList.add(Alarm.fromMap(map));
      });
    }
    return alarmsList; 
  }


  Future<Alarm> retrieveAlarm(id) async {
    final db = await database;
    List<Alarm> alarmsList = [];
    List<Map> maps = await db.query('Alarm', where: id);

    if (maps.length > 0) {
      return Alarm.fromMap(maps[0]);
    }
   
  }

    Future<void> deleteAlarm(int id) async {
    final db = await database;
    List<Alarm> alarmsList = [];
    Future<int> deleted = db.delete('Alarm', where: 'id = $id');
   
  }

  Future<List<Alarm>> retrieveAlarms() async {
    final db = await database;
    List<Alarm> alarmsList = [];
    List<Map> maps = await db.query('Alarm',
        columns: ['_id', 'header', 'content', 'date']);
    if (maps.length > 0) {
      maps.forEach((map) {
        alarmsList.add(Alarm.fromMap(map));
      });
    }
    return alarmsList;
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
      "CREATE TABLE IF NOT EXISTS alarms(id INTEGER PRIMARY KEY AUTOINCREMENT, header TEXT, content TEXT, date INT)",
    );
    return database;
  }

    setAlarm(Alarm alarm){

      DateTime date = alarm.time;
      int day = date.day;
      int minute = date.minute;
      int hour = date.hour;

      String label = alarm.label;

      final AndroidIntent intent = AndroidIntent(
      action: 'android.intent.action.SET_ALARM',
      arguments: <String, dynamic>{
        'android.intent.extra.alarm.DAYS': <int>[day],
        'android.intent.extra.alarm.HOUR': hour,
        'android.intent.extra.alarm.MINUTES': minute,
        'android.intent.extra.alarm.SKIP_UI': true,
        'android.intent.extra.alarm.MESSAGE': label,
      },
    );
    intent.launch();
  }

  

  dismissAlarm(){

  }

}
