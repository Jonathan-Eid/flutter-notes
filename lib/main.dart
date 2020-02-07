import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_notes/views/index.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:android_intent/android_intent.dart';



void main() async {
  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Notes',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: TabsPage()
    );
  }
}
