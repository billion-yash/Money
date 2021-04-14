import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:money/Widgets/LoginPage/CurrentUser.dart';
import 'package:money/Widgets/LoginPage/MainCard.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User getUser() {
    User user = FirebaseAuth.instance.currentUser;
    return user;
  }

  @override
  Widget build(BuildContext context) {
    if (getUser() == null) {
      return MainCard(getUser);
    } else {
      return CurretUser();
    }
  }
}
