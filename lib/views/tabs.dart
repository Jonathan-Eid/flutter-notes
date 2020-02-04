
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_notes/views/screens/notes.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({ Key key }) : super(key: key);
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> with SingleTickerProviderStateMixin {
  final List<Tab> _tabs = <Tab>[
    Tab(icon: Icon(Icons.book), text: "Notes"),
    Tab(icon: Icon(Icons.access_alarm), text: "Alarms"),
    Tab(icon: Icon(Icons.history), text: "History")
  ];

  final List<Widget> widgets= <Widget>[
          NotesPage(title: "Notes"),
          NotesPage(title: "Alarms"),
          NotesPage(title: "History")
        ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);
  }

 @override
 void dispose() {
   _tabController.dispose();
   super.dispose();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TabBar(
          controller: _tabController,
          tabs: _tabs,
          labelColor: Colors.black87,
          indicatorColor: Colors.black87,
        ),
      body: TabBarView(
        controller: _tabController,
        children: widgets,
      )
    );
  }
}