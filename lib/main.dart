import 'package:flutter/material.dart';
import 'package:videocourseapp/drawer.dart';
import 'package:videocourseapp/invite.dart';
import 'package:firebase_core/firebase_core.dart';

import 'contact.dart';
import 'courses.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(0,0));
}

class MyApp extends StatefulWidget {

  int screen,sessionNo;

  MyApp(this.screen,this.sessionNo);

  @override
  _MyAppState createState() => _MyAppState(screen,sessionNo);
}

class _MyAppState extends State<MyApp> {

  int screen,sessionNo;

  _MyAppState(this.screen,this.sessionNo);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Courses")),
        body: screen==0?Courses(sessionNo):screen==1?Invite():Contact(),
        drawer: NavDrawer(screen),
      ),
    );
  }
}

