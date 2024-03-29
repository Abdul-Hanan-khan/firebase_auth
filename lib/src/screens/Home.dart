import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/src/screens/Login.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Home"),
          ),
        ),
        body: Center(
          child: FlatButton(
            child: Text("Logout"),
            onPressed: (){
              auth.signOut();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> LoginScreen()));

            },
          ),
        ),
      ),
    );
  }
}
