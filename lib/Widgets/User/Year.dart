import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:money/Design/mColors.dart';

class Year extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mColors.primaryColor,
      appBar: AppBar(
        title: Text("Choose Year"),
        backgroundColor: mColors.primaryDarkColor,
        brightness: Brightness.dark,
      ),
      body: Container(
        height: 380,
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("users")
                .doc(FirebaseAuth.instance.currentUser.phoneNumber)
                .collection("transactions")
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final List<DocumentSnapshot> documents = snapshot.data.docs;
                return ListView(
                    children: documents
                        .map((doc) => Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/home/year/month',
                              arguments: {"year": doc.id});
                        },
                        child: Text(doc.id),
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
                      ),
                    ))
                        .toList());
              } else if (snapshot.hasError) {
                return Text("It's Error!");
              }
              return Text("Nothing to Show");
            }),
      ),
    );
  }
}
