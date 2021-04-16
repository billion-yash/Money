import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CurrentUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
        onPressed: () {
          FirebaseAuth.instance.signOut();
          Navigator.pushReplacementNamed(context, '/loginPage');
        },
        child: Text("Sign Out"),
      ),
      Text(FirebaseAuth.instance.currentUser.phoneNumber),
    ]);
  }
}
