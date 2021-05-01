import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/src/screens/varify.dart';

import 'package:flutter/material.dart';

import 'Home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Login")),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email",
                ),
                onChanged: (value) {
                  setState(() {
                    _email = value.trim();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(hintText: "Password"),
                onChanged: (value) {
                  setState(() {
                    _password = value.trim();
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(

                  child: Text("Login"),
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    try{
                      auth.signInWithEmailAndPassword(email: _email, password: _password).then((_){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomeScreen()));
                        print("User Logged In");
                      });

                    }catch(e){
                      print("_________Error: "+e);
                    }

                  },
                ),
                RaisedButton(

                  child: Text("Sing-up"),
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    try{
                      auth.createUserWithEmailAndPassword(email: _email, password: _password).then((_){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> VarifyScreen()));

                      });
                      print("User Created");

                    }catch(e){
                      print("______________Error:"+e);
                    }



                  },
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
