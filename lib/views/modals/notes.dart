import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class NotesModal extends StatelessWidget {
  NotesModal({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;



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
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black87
        ),
        backgroundColor: Colors.transparent,
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30
            )
        ),
        elevation: 0,
        // Here we take the value from the NotesModal object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Padding(
          padding: const EdgeInsets.only(top:20.0),
          child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter a note header'
              ),
              maxLines: 1,
              maxLength: 24,
              maxLengthEnforced: true,
              style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30
              )
          ),        
        )
      
      ),
      body: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          children: <Widget>[
                TextField(
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Write a note...'
                ),
                style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20
                )
            )
          ],
        ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed:() {
          Navigator.pop(context);
        },
        backgroundColor: Colors.black87,
        tooltip: 'Trash Note',
        child: Icon(Icons.delete),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
