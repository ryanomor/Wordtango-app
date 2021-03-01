import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wordtango/pages/signin.dart';
import 'package:wordtango/pages/welcome/welcome.dart';
import 'package:wordtango/widgets/appNav.dart';
import 'package:wordtango/assets/wordtango_icons_icons.dart';

// import 'package:google_sign_in/google_sign_in.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool isAuth = true;
  int navIndex = 0;
  final appPages = <Widget>[];
  final List<IconData> pageIcons = [
    WordtangoIcons.logo_notif,
    WordtangoIcons.notif,
    WordtangoIcons.pic,
  ];

  @override
  Widget build(BuildContext context) {
    return isAuth
        ? Welcome()
        : Scaffold(
            appBar: AppBar(
              title: AppNav(
                icons: pageIcons,
              ),
            ),
            // body: appPages[navIndex],
          );
    // return isAuth ? buildAuthScreen() : buildUnauthScreen();
  }
}
