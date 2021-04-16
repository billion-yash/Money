import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainCard extends StatefulWidget {
  final Function getUser;

  MainCard(this.getUser);

  @override
  State<StatefulWidget> createState() {
    return MainCardState(getUser);
  }
}

class MainCardState extends State<MainCard> {
  Function getUser;

  MainCardState(this.getUser);

  bool isOTPSent = false;
  String verificationId;
  TextEditingController phoneNumber, otpController;
  String otp;

  void checkPhoneNumberAndSendOTP() {
    if (phoneNumber.text.length == 10) {
      sentOTP(phoneNumber.text);
    }
  }

  void verifyOTP() {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpController.text);
    FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) => print(value.toString()));
    getUser();
  }

  Future<void> sentOTP(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91" + phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int resendToken) {
        this.verificationId = verificationId;
        setState(() {
          isOTPSent = true;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    phoneNumber = TextEditingController();
    otpController = TextEditingController();
    return isOTPSent
        ? Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  controller: phoneNumber,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter phone number',
                  ),
                ),
                ElevatedButton(
                  onPressed: checkPhoneNumberAndSendOTP,
                  child: Text("sent OTP"),
                ),
                TextField(
                  controller: otpController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter OTP',
                  ),
                ),
                ElevatedButton(
                  onPressed: verifyOTP,
                  child: Text("verify"),
                ),
              ],
            ))
        : Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  controller: phoneNumber,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter phone number',
                  ),
                ),
                ElevatedButton(
                  onPressed: checkPhoneNumberAndSendOTP,
                  child: Text("sent OTP"),
                ),
              ],
            ));
  }
}
