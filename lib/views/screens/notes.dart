import 'package:flutter/material.dart';
import 'package:flutter_notes/models/notes.dart';
import 'package:flutter_notes/services/notes.dart';
import 'package:flutter_notes/views/modals/notes.dart';
import 'package:intl/intl.dart';


class NotesPage extends StatelessWidget {
  NotesPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  Future<List<Notes>> curMonthNotes = NotesService().retrieveCurrentMonthsNotes();
  


Widget notesDisplay(BuildContext context) {
  return FutureBuilder<List<Notes>>(
    future: curMonthNotes, // a previously-obtained Future<String> or null
    builder: (BuildContext context, AsyncSnapshot<List<Notes>> snapshot) {
      List<Widget> children;

      if (snapshot.hasData) {
        children = <Widget>[
          Icon(
            Icons.check_circle_outline,
            color: Colors.green,
            size: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text('Result: ${snapshot.data}'),
          )
        ];
      } else if (snapshot.hasError) {
        children = <Widget>[
          Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text('Error: ${snapshot.error}'),
          )
        ];
      } else {
        children = <Widget>[
          SizedBox(
            child: CircularProgressIndicator(),
            width: 60,
            height: 60,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text('Awaiting result...'),
          )
        ];
      }
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    final DateTime date = DateTime.now();
    final String title = DateFormat('yMMMM').format(date).toString();
    

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30
            )
        ),
        elevation: 0,
        // Here we take the value from the NotesPage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: notesDisplay(context),
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => NotesModal()));
        },
        backgroundColor: Colors.black87,
        tooltip: 'Add Note',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
