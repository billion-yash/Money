import 'package:cloud_firestore/cloud_firestore.dart';
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

      FirebaseFirestore.instance
          .collection("path")
          .doc(td.title)
          .set({"name": "$amt"});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        MainCard(),
        AddTrasaction(addTransaction),
        TrasactionList(list),
      ],
    ));
  }
}
