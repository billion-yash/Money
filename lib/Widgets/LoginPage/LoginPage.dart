import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:money/Design/mColors.dart';

class LoginPage extends StatefulWidget {
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
    EasyLoading.instance..backgroundColor = mColors.maskColor..maskColor = mColors.maskColor;
    if (phoneNumber.text.length == 10) {
      EasyLoading.show(
        status: 'Sending OTP...', maskType: EasyLoadingMaskType.custom ,
        indicator: SpinKitFadingCube(color: mColors.secondaryColor,size: 50.0)
      );
      sentOTP(phoneNumber.text);
    } else {
      EasyLoading.showError(
        'Enter Valid Number',
      );
    }
  }

  void verifyOTP() async {
    if (verificationId == null || otpController.text == "") {
      EasyLoading.showError(
        'invalid OTP',
      );
    } else {
      EasyLoading.show(
        status: 'Please Wait...',
      );
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otpController.text);

      UserCredential user =
          await FirebaseAuth.instance.signInWithCredential(credential);
      if (user != null) {
        EasyLoading.showToast("Logged in successfully.",
            toastPosition: EasyLoadingToastPosition.bottom);
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        EasyLoading.showError("Enter valid OTP");
      }
    }
  }

  Future<void> sentOTP(String phoneNumber) async {
    if (!kIsWeb) {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91" + phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          EasyLoading.showToast("something went wrong!",
              toastPosition: EasyLoadingToastPosition.bottom);
        },
        codeSent: (String verificationId, int resendToken) {
          EasyLoading.showSuccess('OTP sent!');
          this.verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } else {
      ConfirmationResult confirmationResult = await FirebaseAuth.instance
          .signInWithPhoneNumber("+91" + phoneNumber);
      if (confirmationResult.verificationId != null) {
        this.verificationId = confirmationResult.verificationId;
        EasyLoading.showSuccess('OTP sent!');
      } else {
        EasyLoading.showToast("something went wrong!",
            toastPosition: EasyLoadingToastPosition.bottom);
      }
    }
  }
  @override
  Widget build(BuildContext context) {

    phoneNumber = TextEditingController();
    otpController = TextEditingController();
    return Scaffold(
        backgroundColor: mColors.primaryColor,
        body: SafeArea(
          child: Container(
              margin: EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextField(
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 10,
                        color: mColors.secondaryLightColor,
                      ),
                      controller: phoneNumber,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      cursorColor: mColors.secondaryLightColor,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                      ),
                    ),
                    TextField(
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 10,

                        color: mColors.secondaryLightColor,
                      ),
                      controller: otpController,
                      maxLength: 6,
                      keyboardType: TextInputType.number,
                      cursorColor: mColors.secondaryLightColor,
                      decoration: InputDecoration(
                        labelText: 'OTP',
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.7,
                      child: ElevatedButton(
                        style:  ButtonStyle(
                            shadowColor: MaterialStateProperty.all<Color>(mColors.secondaryDarkColor),
                            elevation: MaterialStateProperty.all<double>(7),
                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(15)),
                            backgroundColor: MaterialStateProperty.all<Color>(mColors.secondaryColor),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                )
                            )
                        ),
                        onPressed: checkPhoneNumberAndSendOTP,
                        child: Text("SEND OTP"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width*0.7,
                      child: ElevatedButton(
                        style:  ButtonStyle(
                            elevation: MaterialStateProperty.all<double>(7),
                            shadowColor: MaterialStateProperty.all<Color>(mColors.secondaryDarkColor),
                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(15)),
                            backgroundColor: MaterialStateProperty.all<Color>(mColors.secondaryColor),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                )
                            )
                        ),
                        onPressed: verifyOTP,
                        child: Text("VERIFY"),
                      ),
                    )
                  ],
                ),
              )),
        ));
  }
}
