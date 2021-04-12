import 'package:flutter/material.dart';

class MainCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainCardState();
  }
}

class MainCardState extends State<MainCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text("smaple"),
      color: Colors.amber,
      height: 180,
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
    );
  }
}
