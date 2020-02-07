import '../models/alarm.dart';
import './database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:android_intent/android_intent.dart';


class AlarmService{


  Database _database; 

    /**/



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
