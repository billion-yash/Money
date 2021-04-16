import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  String verificationId;
  TextEditingController phoneNumber, otpController;
  String otp;

  void checkPhoneNumberAndSendOTP() {
    if (phoneNumber.text.length == 10) {
      sentOTP(phoneNumber.text);
    }
  }

  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpController.text);

    UserCredential user= await FirebaseAuth.instance.signInWithCredential(credential);
    if(user!=null){
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  Future<void> sentOTP(String phoneNumber) async {
    if(!kIsWeb){
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91" + phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int resendToken) {
          this.verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    }
    else{
      ConfirmationResult confirmationResult =  await FirebaseAuth.instance.signInWithPhoneNumber("+91" + phoneNumber);
      this.verificationId = confirmationResult.verificationId;
    }
  }

  @override
  Widget build(BuildContext context) {
    phoneNumber = TextEditingController();
    otpController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body:  Container(
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
    );
  }
}
