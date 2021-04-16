import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:money/LoadingScreen.dart';

import 'Widgets/LoginPage/LoginPage.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/' : (context) => LoadingScreen(),
          '/loginPage' : (context) => LoginPage(),
          '/home' : (context) => MainClassWidget(),
        },
        initialRoute: '/',
      );
  }
}
