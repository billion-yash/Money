import 'package:firebase_auth/firebase_auth.dart';

class UserData{
  String phoneNumber;
  static UserData user ;

  UserData(){
    user.phoneNumber = FirebaseAuth.instance.currentUser.phoneNumber;
  }

  static UserData getUser(){
    if(user == null ){
      // ignore: unnecessary_statements
      user == new UserData();
    }
    return user;
  }

}