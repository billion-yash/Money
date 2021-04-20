import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money/Design/mColors.dart';

// ignore: must_be_immutable
class Month extends StatelessWidget {
  Map<String, Object> data;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: mColors.primaryColor,
      appBar: AppBar(
        backgroundColor: mColors.primaryDarkColor,
        title: Text("Month"),
        brightness: Brightness.dark,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: listOfBtns(context),
        ),
      ),
    );
  }

  List<Widget> listOfBtns(context) {
    List<Widget> list = [];
    for (int i = 1; i < 13; i++) {
      list.add(
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 4),
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home/year/month/history',
                  arguments: {'year': data['year'], 'month': i.toString()});
            },
            child: Text(getMonth(i) ,style: TextStyle(fontSize: 18 ),),
            style: ButtonStyle(
                shadowColor: MaterialStateProperty.all<Color>(
                    mColors.secondaryDarkColor),
                elevation: MaterialStateProperty.all<double>(7),
                padding:
                MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.all(10)),
                backgroundColor: MaterialStateProperty.all<Color>(
                    mColors.secondaryColor),
                shape:
                MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ))),
          ),
        )
      );
    }
    return list;
  }

  String getMonth(int i) {
    switch(i){
      case 1:
        return "January";
      case 2:
        return "February ";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November ";
      default:
        return "December";
    }
  }
}
