import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Widgets/LoginPage/MainCard.dart';
import 'Widgets/MainClassWidget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MainClass());
}

class MainClass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainState();
  }
}

class MainState extends State<MainClass> {
  bool initialized = false;

  Future<void> initilizeFirebase() async {
    try {
      await Firebase.initializeApp();
      setState(() => initialized = true);
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    initilizeFirebase();
  }

  @override
  Widget build(BuildContext context) {
    MaterialApp materialApp = getApp();
    return materialApp;
  }

  void getUser() {
    setState(() {
      getApp();
      getApp();
    });
  }

  MaterialApp getApp() {
    if (FirebaseAuth.instance.currentUser == null) {
      return MaterialApp(
          home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Money"),
        ),
        body: MainCard(getUser),
      ));
    } else {
      return MaterialApp(
        home: MainClassWidget(getUser),
      );
    }
  }
}
