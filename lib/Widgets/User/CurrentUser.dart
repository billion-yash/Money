import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money/Design/mColors.dart';
import 'package:url_launcher/url_launcher.dart';

class CurrentUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Card(
        margin: EdgeInsets.all(15),
        color: mColors.primaryDarkColor,
        child: Container(
          margin: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "User",
                style: TextStyle(
                    fontFamily: 'Righteous',
                    color: mColors.secondaryColor,
                    fontSize: 30),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                FirebaseAuth.instance.currentUser.phoneNumber,
                style: TextStyle(
                    fontFamily: 'Righteous',
                    color: CupertinoColors.white,
                    fontSize: 25),
              ),
              SizedBox(
                height: 5,
              ),
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, '/loginPage');
                },
                child: Text("Sign Out"),
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(7),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(vertical: 12, horizontal: 25)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ))),
              ),
            ],
          ),
        ),
      ),
      Card(
        margin: EdgeInsets.all(15),
        color: mColors.primaryDarkColor,
        child: Container(
          margin: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "History",
                style: TextStyle(
                    fontFamily: 'Righteous',
                    color: mColors.secondaryColor,
                    fontSize: 30),
              ),
              SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/home/year'),
                child: Text("Watch"),
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(7),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(vertical: 12, horizontal: 25)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ))),
              ),
            ],
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              iconSize: 40,
              icon: Image.asset("assets/icon/gihub.png",color: Colors.white70,),
              onPressed: () {
                launch('https://github.com/billion-yash/money');
              }
          ),
          IconButton(
            icon: Image.asset("assets/icon/my_logo.png",color: Colors.white70,),
              iconSize: 40,
              onPressed: () {
                launch('https://money.yashdhanlobhe.tech/');
              }
          ),
          IconButton(
              icon: Icon(Icons.web ,color: Colors.white70,),
              iconSize: 40,
              onPressed: () {
                launch('https://yashdhanlobhe.tech/');
              }
          ),
        ],
      )
    ]);
  }
}
