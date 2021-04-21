import 'package:flutter/material.dart';
import 'package:money/Design/mColors.dart';
import 'package:money/Widgets/TransactionPage/UpdatePocket.dart';

class AddTransaction extends StatefulWidget {
  final Function addTransactionToDatabase;

  AddTransaction(this.addTransactionToDatabase);

  @override
  _AddTransactionState createState() => _AddTransactionState(addTransactionToDatabase);
}

class _AddTransactionState extends State<AddTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTransactionToDatabase;

  _AddTransactionState(this.addTransactionToDatabase);

  int radioValue = 1;

  void _handleRadioValueChange(int value) {
    setState(() {
      radioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: isPortrait(context)? MediaQuery.of(context).size.width : MediaQuery.of(context).size.width*0.5,
        child : Card(
          color: mColors.primaryDarkColor,
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  cursorColor: mColors.secondaryColor,
                  cursorHeight: 20,
                  style: TextStyle(color: mColors.secondaryColor,fontSize: 15),
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: TextStyle(color: Colors.white),
                    focusColor: mColors.secondaryColor,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  cursorColor: mColors.secondaryColor,
                  cursorHeight: 20,
                  style: TextStyle(color: mColors.secondaryColor ,fontSize: 15),
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    labelStyle: TextStyle(color: Colors.white),
                    focusColor: mColors.secondaryColor,
                  ),
                ),
              ),
              Container(
                  child: Row(
                    children: [
                      new Radio(
                        fillColor: MaterialStateProperty.all<Color>(Colors.green),
                        value: 1,
                        groupValue: radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                      new Text(
                        'Earned',
                        style: new TextStyle(
                            color: Colors.green,
                            fontSize: 16.0),
                      ),
                      new Radio(
                        fillColor : MaterialStateProperty.all<Color>(Colors.red),
                        value: -1,
                        groupValue: radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                      new Text(
                        'Spend',
                        style: new TextStyle(
                          color: Colors.red,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  )),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: ElevatedButton(
                  onPressed: () {
                    UpdatePocket.addTransactionPocket(
                        titleController.text, double.parse(amountController.text)*radioValue);
                  },
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(7),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(mColors.secondaryColor),
                    shadowColor: MaterialStateProperty.all<Color>(
                        mColors.secondaryDarkColor),
                  ),
                  child: Text("Add Transaction" , style: TextStyle(color: mColors.primaryDarkColor),),
                ),
              )
            ],
          ),
        )
    );
  }
  static bool isPortrait(context) {
    if(MediaQuery.of(context).orientation == Orientation.portrait){
      return true;
    }
    return false;
  }
}
