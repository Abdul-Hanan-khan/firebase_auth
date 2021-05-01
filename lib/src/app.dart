
import 'package:firebase_authentication/src/screens/Login.dart';
import 'package:flutter/material.dart';
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "login App",
      theme:  ThemeData(
        accentColor: Colors.orange,
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
