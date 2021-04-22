import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  String otp;
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController otpController = TextEditingController();
  void checkPhoneNumberAndSendOTP() {
    EasyLoading.instance
      ..backgroundColor = mColors.maskColor
      ..maskColor = mColors.maskColor;
    if (phoneNumber.text.length == 10) {
      EasyLoading.show(
          status: 'Sending OTP...',
          maskType: EasyLoadingMaskType.custom,
          indicator:
              SpinKitFadingCube(color: mColors.secondaryColor, size: 50.0),
          dismissOnTap: true);
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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: mColors.primaryColor,
      body: SafeArea(
        child: isPortrait(context)? portraitWidget() : landscapeWidget(),
      ),
    );
  }


  static bool isPortrait(context) {
    if(MediaQuery.of(context).orientation == Orientation.portrait){
      return true;
    }
    return false;
  }

  landscapeWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height*0.9,
          width: MediaQuery.of(context).size.width*0.4,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(25, 50, 50, 20),
                child: Text(
                  "Beware of little expenses. A small leak will sink a great ship.",
                  style: TextStyle(
                      fontFamily: 'Righteous',
                      fontSize: 30,
                      color: Colors.white70,
                      letterSpacing: 4),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.fromLTRB(10 , 5 , 30 , 10),
                child: Text(
                  "-Benjamin Franklin",
                  style: TextStyle(
                    fontFamily: 'Righteous',
                    fontSize: 15,
                    color: Colors.white70,),
                ),
              )
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width*0.4,
          height: MediaQuery.of(context).size.height*0.9,
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new TextFormField(
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
                new TextFormField(
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
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shadowColor: MaterialStateProperty.all<Color>(
                            mColors.secondaryDarkColor),
                        elevation: MaterialStateProperty.all<double>(7),
                        padding:
                        MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(15)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            mColors.secondaryColor),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ))),
                    onPressed: checkPhoneNumberAndSendOTP,
                    child: Text("SEND OTP"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(7),
                        shadowColor: MaterialStateProperty.all<Color>(
                            mColors.secondaryDarkColor),
                        padding:
                        MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(15)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            mColors.secondaryColor),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ))),
                    onPressed: verifyOTP,
                    child: Text("VERIFY"),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  portraitWidget() {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(25 , 45 , 25 , 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new TextFormField(
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
              new TextFormField(
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
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all<Color>(
                          mColors.secondaryDarkColor),
                      elevation: MaterialStateProperty.all<double>(7),
                      padding:
                      MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.all(15)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          mColors.secondaryColor),
                      shape:
                      MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ))),
                  onPressed: checkPhoneNumberAndSendOTP,
                  child: Text("SEND OTP"),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(7),
                      shadowColor: MaterialStateProperty.all<Color>(
                          mColors.secondaryDarkColor),
                      padding:
                      MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.all(15)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          mColors.secondaryColor),
                      shape:
                      MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ))),
                  onPressed: verifyOTP,
                  child: Text("VERIFY"),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(25, 50, 50, 20),
          child: Text(
            "Beware of little expenses. A small leak will sink a great ship.",
            style: TextStyle(
                fontFamily: 'Righteous',
                fontSize: 25,
                color: Colors.white70,
                letterSpacing: 4),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          margin: EdgeInsets.fromLTRB(10 , 5 , 30 , 10),
          child: Text(
            "-Benjamin Franklin",
            style: TextStyle(
              fontFamily: 'Righteous',
              fontSize: 15,
              color: Colors.white70,),
          ),
        )
      ],
    );
  }

}
