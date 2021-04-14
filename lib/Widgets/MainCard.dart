import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainCardState();
  }
}

class MainCardState extends State<MainCard> {
  void singIn() {}
  Future<void> sentOTP() async {
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+918668611930 ',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

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
