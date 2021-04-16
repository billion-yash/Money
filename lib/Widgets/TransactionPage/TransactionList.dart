import 'package:flutter/material.dart';
import 'package:money/DataStructure/TransactionData.dart';

class TransactionList extends StatelessWidget {
  final List<TransactionData> transactionList;
  TransactionList(this.transactionList);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  child: Text(transactionList[index].title),
                ),
              ],
            ),
          );
        },
        itemCount: transactionList.length,
      ),
    );
  }
}
