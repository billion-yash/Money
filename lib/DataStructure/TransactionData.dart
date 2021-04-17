import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionData {
  final DateTime id;
  final String title;
  final double amount;

  TransactionData({this.id
  ,this.title, this.amount });
}
