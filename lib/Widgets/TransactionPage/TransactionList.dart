import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:money/DataStructure/TransactionData.dart';

class TransactionList extends StatelessWidget {
  final CollectionReference transactionList;
  TransactionList(this.transactionList);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: StreamBuilder<QuerySnapshot>(
          stream: transactionList.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<DocumentSnapshot> documents = snapshot.data.docs;
              return ListView(
                  children: documents
                      .map((doc) => Card(
                    child: ListTile(
                      title: Text(doc["title"]),
                      subtitle: Text(doc["spend"].toString()),
                    ),
                  ))
                      .toList());
            } else if (snapshot.hasError) {
              return Text("It's Error!");
              }
            return Text("data");
              }),
    );
  }
}
