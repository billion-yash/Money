import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:money/Design/mColors.dart';

class LoadingScreen extends StatelessWidget {
  Future<void> initializeFirebase(BuildContext context) async {
    try {
      await Firebase.initializeApp();
    } catch (e) {}
    await Future.delayed(Duration(milliseconds: 1950), () {});
    doneInitializing(context);
  }

  void doneInitializing(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      Navigator.pushReplacementNamed(context, "/home");
    } else {
      Navigator.pushReplacementNamed(context, "/loginPage");
    }
  }

  @override
  Widget build(BuildContext context) {
    initializeFirebase(context);
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: mColors.primaryColor,
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/icon/appicon.png',
                height: 120,
                width: 120,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SpinKitPouringHourglass(
                  color: mColors.secondaryColor,
                  duration: Duration(milliseconds: 700),
                  size: 40.0,
                ),
                Container(
                  child: Image.asset(
                    'assets/icon/my_logo.png',
                    height: 60,
                    width: 60,
                  ),
                  margin: EdgeInsets.all(15),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
