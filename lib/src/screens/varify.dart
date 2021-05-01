import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/src/screens/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VarifyScreen extends StatefulWidget {
  @override
  _VarifyScreenState createState() => _VarifyScreenState();
}

class _VarifyScreenState extends State<VarifyScreen> {
  final auth = FirebaseAuth.instance;
  User user;
  Timer timer;

  @override
  void initState() {
    user = auth.currentUser;
    user.sendEmailVerification();
    timer= Timer.periodic(Duration(seconds: 5), (timer) {

    });
    super.initState();
  }
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("An email is send to ${user.email} ....Please confirm"),
      ),
    );
  }
Future ()async{
    user= auth.currentUser;
    await user.reload();
    if(user.emailVerified){
      timer.cancel();
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomeScreen()));
    }

}

}
