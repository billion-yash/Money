import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:money/DataStructure/TransactionData.dart';

import 'AddTransaction.dart';
import 'TransactionList.dart';

class AddTransactionPage extends StatefulWidget {
  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  void addTransaction(String title, double amt) {
    final td = TransactionData(title: title, amount: amt, id: DateTime.now());
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser.phoneNumber)
        .collection("total")
        .doc("overall")
        .set({"spend": FieldValue.increment(amt.toInt())},
            SetOptions(merge: true));

    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser.phoneNumber)
        .collection("transactions")
        .doc(td.id.year.toString())
        .collection(td.id.month.toString())
        .doc(td.id.toString())
        .set({"spend": td.amount, "title": td.title}, SetOptions(merge: true));
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddTransaction(addTransaction),
          TransactionList(FirebaseFirestore.instance
              .collection("users")
              .doc(FirebaseAuth.instance.currentUser.phoneNumber)
              .collection("transactions")
              .doc(DateTime.now().year.toString())
              .collection(DateTime.now().month.toString())),
        ],
      );
    } else {
      return Column(
        children: [
          AddTransaction(addTransaction),
          TransactionList(FirebaseFirestore.instance
              .collection("users")
              .doc(FirebaseAuth.instance.currentUser.phoneNumber)
              .collection("transactions")
              .doc(DateTime.now().year.toString())
              .collection(DateTime.now().month.toString())),

        ],
      );
    }
  }
}
