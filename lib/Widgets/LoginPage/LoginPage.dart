import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.fadingCube;
    if (phoneNumber.text.length == 10) {
      EasyLoading.show(status: 'Sending OTP...',);
      sentOTP(phoneNumber.text);
    }
    else{
      EasyLoading.showError('Enter Valid Number', );
    }
  }

  void verifyOTP() async {
    if(verificationId == null || otpController.text == ""){
      EasyLoading.showError('invalid OTP',);
    }
    else {
      EasyLoading.show(
        status: 'Please Wait...',
      );
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otpController.text);

      UserCredential user =
      await FirebaseAuth.instance.signInWithCredential(credential);
      if(user!=null){
        EasyLoading.showToast("Logged in successfully." , toastPosition: EasyLoadingToastPosition.bottom);
        Navigator.pushReplacementNamed(context, '/home');
      }else{
        EasyLoading.showError("Enter valid OTP");
      }
    }
  }

  Future<void> sentOTP(String phoneNumber) async {
    if(!kIsWeb){
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91" + phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {

        },
        verificationFailed: (FirebaseAuthException e) {
          EasyLoading.showToast("something went wrong!" , toastPosition: EasyLoadingToastPosition.bottom);
        },
        codeSent: (String verificationId, int resendToken) {
          EasyLoading.showSuccess('OTP sent!');
          this.verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    }
    else{
      ConfirmationResult confirmationResult =  await FirebaseAuth.instance.signInWithPhoneNumber("+91" + phoneNumber);
      if(confirmationResult.verificationId != null){
        this.verificationId = confirmationResult.verificationId;
        EasyLoading.showSuccess('OTP sent!');
      }
      else{
        EasyLoading.showToast("something went wrong!" , toastPosition: EasyLoadingToastPosition.bottom);
      }
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
                keyboardType: TextInputType.number,
                autofocus: true,
                maxLength: 10,
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
                autofocus: true,
                maxLength: 6,
                keyboardType: TextInputType.number,
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
