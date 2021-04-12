import 'package:flutter/material.dart';
import 'package:money/Widgets/MainClassWidget.dart';

void main() {
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
        home: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Money"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainClassWidget(),
          ],
        ),
      ),
    )
    );
  }
}
