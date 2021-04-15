import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CurretUser extends StatelessWidget {
  final Function getUser;
  CurretUser(this.getUser);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          FirebaseAuth.instance.signOut();
          getUser();
        },
        child: Text("Sign Out"),
      ),
    );
  }
}
