import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/illustrations/Asset 21.png'),
            alignment: Alignment.bottomLeft,
          ),
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Colors.blueAccent[400],
              Theme.of(context).primaryColor,
              Colors.red[400],
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logos/longWhite.png'),
            SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
      // bottomNavigationBar: Text('hi'),
      // persistentFooterButtons: [Text('hi'), Text('hey')],
    );
  }
}
