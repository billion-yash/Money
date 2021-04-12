import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:money/DataStructure/TransactionData.dart';
import 'package:money/Widgets/AddTrasaction.dart';
import 'package:money/Widgets/MainCard.dart';
import 'package:flutter/material.dart';
import 'package:money/Widgets/TrasitionList.dart';

class MainClassWidget extends StatefulWidget {
  @override
  _MainClassWidgetState createState() => _MainClassWidgetState();
}

class _MainClassWidgetState extends State<MainClassWidget> {
  final List<TransactionData> list = [];

  void addTransaction(String title, double amt) {
    final td = TransactionData(title: title, amount: amt);
    setState(() {
      list.add(td);
      Firestore.instance
          .collection("path")
          .document(td.title)
          .setData({"name": "$amt"});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainCard(),
        AddTrasaction(addTransaction),
        TrasactionList(list),
      ],
    );
  }
}
