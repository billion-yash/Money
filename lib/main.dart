import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:money/Design/mColors.dart';
import 'package:money/LoadingScreen.dart';
import 'package:money/Widgets/SummaryPage/showHistory.dart';

import 'Widgets/LoginPage/LoginPage.dart';
import 'Widgets/MainClassWidget.dart';
import 'Widgets/SummaryPage/Month.dart';
import 'Widgets/SummaryPage/Year.dart';

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
      theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(color: mColors.primaryTextColor , fontSize: 15 , letterSpacing: 4),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: mColors.secondaryLightColor)) , enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: mColors.primaryTextColor)))),


      builder: EasyLoading.init(),
      routes: {
        '/': (context) => LoadingScreen(),
        '/loginPage': (context) => LoginPage(),
        '/home': (context) => MainClassWidget(),
        '/home/year': (context) => Year(),
        '/home/year/month': (context) => Month(),
        '/home/year/month/history': (context) => ShowHistory(),
      },
      initialRoute: '/',
    );
  }
}
