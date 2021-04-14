import 'dart:ffi';

import 'package:flutter/material.dart';

class MainCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainCardState();
  }
}

class MainCardState extends State<MainCard> {
  void singIn() {}
  void sentOTP() {}

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        RaisedButton(
          onPressed: singIn,
          child: Text("Sign In"),
        ),
        RaisedButton(
          onPressed: sentOTP,
          child: Text("sent OTP"),
        ),
      ],
    ));
  }
}
