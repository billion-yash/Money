import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money/Widgets/TransactionPage/TransactionList.dart';

class ShowHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String , Object> data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text("History"),),
      body: TransactionList(FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser.phoneNumber)
          .collection("transactions")
          .doc(data['year'])
          .collection(data['month']),
    ));
  }
}
