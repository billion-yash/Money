import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money/Widgets/TransactionPage/UpdatePocket.dart';

import '../../Design/mColors.dart';

class TransactionHistoryWidget extends StatelessWidget {
  final DocumentSnapshot doc;
  final CollectionReference collectionReference;
  TransactionHistoryWidget(this.doc , this.collectionReference);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          color: mColors.primaryDarkColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerRight,
                width: MediaQuery.of(context).size.width*0.3,
                margin: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    doc['spend'].toString().split('.')[0],
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
              Container(
                width: MediaQuery.of(context).size.width*0.40,
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(doc["title"] ,style: TextStyle(color: mColors.secondaryColor, fontSize: 22),),
                    Text(formatDate(DateTime.parse(doc.id), [dd ," " ,M , " " , yyyy]), style: TextStyle(color: Colors.white54),),
                  ],
                ),
              ),
              // IconButton(icon: Icon(Icons.delete ,color: Colors.red,), onPressed: ()=>deleteTransaction(doc.id ,doc)),
            ],
          ),
      ),
      
    );
  }

  static Color getColor(String str) {
    double value = double.parse(str);
    if (value.isNegative) {
      return Colors.red;
    }
    return Colors.green;
  }

  void deleteTransaction(String id ,DocumentSnapshot documentSnapshot) {
    collectionReference.doc(id).delete();
    UpdatePocket.deleteTransaction(documentSnapshot);
    }
}
