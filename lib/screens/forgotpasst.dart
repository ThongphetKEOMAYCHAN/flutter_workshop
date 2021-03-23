
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app/screens/signup.dart';


class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String _email;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
            builder: (BuildContext context) {
              return IconButton(icon: const Icon(
                Icons.keyboard_backspace, color: Colors.white,),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              );
            }
        ),
        title: Text("Reset Password"),
        centerTitle: true,
      ),
      body: Column(

        children: [
          SizedBox(height: 50.0,),
          Padding(padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "email",
              ),
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(
                child: Text("Send Reset"),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                onPressed: () {
                  /*auth.sendPasswordResetEmail(email: _email);
                  Navigator.of(context).pop();*/
                  auth.sendPasswordResetEmail(email: _email);
                },
                color: Theme
                    .of(context)
                    .accentColor,

              ),
              SizedBox(height: 10.0,),
              RaisedButton(
                child: Text("Create an new Account"),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(SignupScreen.routeName);
                },
                color: Theme
                    .of(context)
                    .accentColor,

              ),
            ],
          ),
        ],
      ),
    );
  }
}
