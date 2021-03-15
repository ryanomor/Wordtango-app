// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wordtango/pages/welcome/welcome.dart';
import 'package:wordtango/pages/dashboard/dashboard.dart';
// import 'package:wordtango/widgets/appNav.dart';
// import 'package:wordtango/assets/wordtango_icons_icons.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool isAuth = false;

  @override
  void initState() {
    super.initState();
    isAuth = FirebaseAuth.instance.currentUser != null ? true : false;
    // FirebaseAuth.instance.authStateChanges().listen((User user) {
    //   if (user == null) {
    //     print('User is currently signed out!');
    //     isAuth = false;
    //   } else {
    //     print('User is signed in!');
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? Dashboard() : Welcome();
  }
}
