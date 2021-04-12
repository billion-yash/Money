import 'package:flutter/material.dart';
import 'package:money/DataStructure/TransactionData.dart';

class AddTrasaction extends StatelessWidget {
  final Function added;
  AddTrasaction(this.added);
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Title",
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: amountController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Rs",
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              added(titleController.text, double.parse(amountController.text));
            },
            child: Text("Add Transaction"),
            textColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
