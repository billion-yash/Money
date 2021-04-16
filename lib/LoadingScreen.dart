import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {

  Future<void> initializeFirebase(BuildContext context) async {
    try {
      await Firebase.initializeApp();
    } catch (e) {}
    doneInitializing(context);

  }

  void doneInitializing(BuildContext context){
    if(FirebaseAuth.instance.currentUser != null){
      Navigator.pushReplacementNamed(context, "/home");
    }else{
      Navigator.pushReplacementNamed(context, "/loginPage");
    }
  }


  @override
  Widget build(BuildContext context) {
    initializeFirebase(context);
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
