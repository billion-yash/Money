import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money/Design/mColors.dart';
import 'package:money/Widgets/User/HistoryList.dart';

class ShowHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, Object> data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: mColors.primaryColor,
        appBar: AppBar(
          title: Text("History"),
          backgroundColor: mColors.primaryDarkColor,
          brightness: Brightness.dark,
        ),
        body: HistoryList(
          FirebaseFirestore.instance
              .collection("users")
              .doc(FirebaseAuth.instance.currentUser.phoneNumber)
              .collection("transactions")
              .doc(data['year'])
              .collection(data['month']),
        ));
  }
}
