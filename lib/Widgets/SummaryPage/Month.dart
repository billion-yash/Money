import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Month extends StatelessWidget {
  Map<String, Object> data;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Month"),
      ),
      body: Container(
        child: Column(
          children: listOfBtns(context),
        ),
      ),
    );
  }

  List<Widget> listOfBtns(context) {
    List<Widget> list = [];
    for (int i = 1; i < 13; i++) {
      list.add(ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home/year/month/history',
                arguments: {'year': data['year'], 'month': i.toString()});
          },
          child: Text(i.toString())));
    }
    return list;
  }
}
