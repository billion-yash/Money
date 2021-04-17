import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:money/DataStructure/TransactionData.dart';
import 'package:flutter/material.dart';
import 'package:money/DataStructure/UserData.dart';
import 'package:money/Widgets/TransactionPage/TransactionList.dart';

import 'AddTransaction.dart';

class AddTransactionPage extends StatefulWidget {
  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final List<TransactionData> list = [];

  void addTransaction(String title, double amt) {
    final td = TransactionData(title: title, amount: amt , id: DateTime.now());
    setState(() {
      list.add(td);
      FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser.phoneNumber)
          .collection("total")
          .doc("overall")
          .set({"spend" : FieldValue.increment(amt.toInt())} , SetOptions(merge: true));

      FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser.phoneNumber)
          .collection("transactions")
          .doc(td.id.month.toString())
          .set({td.id.toString() : {"spend" : td.amount , "title" : td.title}} , SetOptions(merge: true));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddTransaction(addTransaction),
        TransactionList(list),
      ],
    );
  }
}
