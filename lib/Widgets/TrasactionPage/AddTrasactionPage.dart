import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money/DataStructure/TransactionData.dart';
import 'package:money/Widgets/TrasactionPage/AddTrasaction.dart';
import 'package:flutter/material.dart';
import 'package:money/Widgets/TrasactionPage/TrasitionList.dart';

class AddTransactionPage extends StatefulWidget {
  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
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
    return Column(
      children: [
        AddTrasaction(addTransaction),
        TrasactionList(list),
      ],
    );
  }
}
