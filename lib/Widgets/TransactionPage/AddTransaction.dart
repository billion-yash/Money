import 'package:flutter/material.dart';

class AddTransaction extends StatelessWidget {
  final Function added;
  AddTransaction(this.added);
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
          ElevatedButton(
            onPressed: () {
              added(titleController.text, double.parse(amountController.text));
            },
            child: Text("Add Transaction"),
          ),
        ],
      ),
    );
  }
}
