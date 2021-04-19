import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Design/mColors.dart';

class TransactionWidget extends StatelessWidget {
  final DocumentSnapshot doc;

  TransactionWidget(this.doc);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          color: mColors.primaryDarkColor,
          child: Row(
            children: [
              Container(
                alignment: Alignment.centerRight,
                width: MediaQuery.of(context).size.width*0.3,
                margin: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    doc['spend'].toString(),
                    style: TextStyle(
                        fontSize: 28, color: getColor(doc['spend'].toString())),
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white70,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ],
          )),
    );
  }

  static Color getColor(String str) {
    double value = double.parse(str);
    if (value.isNegative) {
      return Colors.red;
    }
    return Colors.green;
  }
}
