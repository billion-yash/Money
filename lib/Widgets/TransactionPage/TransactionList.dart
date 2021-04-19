import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:money/DataStructure/TransactionData.dart';
import 'package:money/Design/mColors.dart';

import 'TransactionHistoryWidget.dart';

class TransactionList extends StatelessWidget {
  final CollectionReference transactionList;
  TransactionList(this.transactionList);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      child: StreamBuilder<QuerySnapshot>(
          stream: transactionList.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<DocumentSnapshot> documents = snapshot.data.docs;
              return ListView(
                  children: documents
                      .map((doc) => TransactionWidget(doc))
                      .toList());
            } else if (snapshot.hasError) {
              return Text("It's Error!");
              }
            return Text("data");
              }),
    );
  }
}
