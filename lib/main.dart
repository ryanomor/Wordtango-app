import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wordtango/pages/app.dart';
import 'package:wordtango/constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

void main() async {
  // Firestore.instance.settings(timestampsInSnapshotsEnabled: true).then((_) {
  //   print("Timestamps enabled in snapshots\n");
  // }, onError: (_) {
  //   print("Error enabling timestamps in snapshots\n");
  // });
  WidgetsFlutterBinding.ensureInitialized();
  await DotEnv.load(fileName: 'lib/config.env');
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wordtango',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.grey[200],
          iconTheme: IconThemeData(
            color: wtPrimaryColor,
          ),
        ),
        primaryColor: wtPrimaryColor,
        accentColor: Colors.blueAccent[400],
      ),
      // darkTheme: ThemeData(), // for dark mode on phones
      home: App(),
    );
  }
}
