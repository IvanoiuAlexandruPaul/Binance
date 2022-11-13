import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'mainscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "Sebi",
    options: const FirebaseOptions(
        apiKey: "AIzaSyCcaZiGnW88v7B4jP5thI2J69Mc8R6cLLs",
        authDomain: "beacon-333811.firebaseapp.com",
        databaseURL:
            "https://beacon-333811-default-rtdb.europe-west1.firebasedatabase.app",
        projectId: "beacon-333811",
        storageBucket: "beacon-333811.appspot.com",
        messagingSenderId: "838593097600",
        appId: "1:838593097600:web:fee1f4511c6fbf77cddb65",
        measurementId: "G-7L9BLR871D"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'P2P Data',
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
        home: mainScreen());
  }
}
