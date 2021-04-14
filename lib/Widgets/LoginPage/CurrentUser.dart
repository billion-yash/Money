import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CurretUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(FirebaseAuth.instance.currentUser.phoneNumber),
    );
  }
}
