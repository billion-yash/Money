import 'package:flutter/material.dart';
import 'package:money/Design/mColors.dart';

class SummaryPage extends StatefulWidget {
  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Card(
          margin: EdgeInsets.all(20),
          color: mColors.primaryDarkColor,
          child: Container(
            padding: EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width*0.9,
            height: MediaQuery.of(context).size.height * 0.35,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Monthly",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Righteous',
                    color: mColors.secondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total spending",
                        style: TextStyle(
                          fontSize: 20,
                          color: mColors.secondaryColor,
                        ),
                      ),
                      Text(
                        "200000" + " Rs",
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.red,
                          fontFamily: 'Righteous',
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Earning",
                        style: TextStyle(
                          fontSize: 20,
                          color: mColors.secondaryColor,
                        ),
                      ),
                      Text(
                        "200000" + " Rs",
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.green,
                          fontFamily: 'Righteous',
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 20,
                          color: mColors.secondaryColor,
                        ),
                      ),
                      Text(
                        "200000" + " Rs",
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.green,
                          fontFamily: 'Righteous',
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.all(20),
          color: mColors.primaryDarkColor,
          child: Container(
            padding: EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width*0.9,
            height: MediaQuery.of(context).size.height * 0.35,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Overall",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Righteous',
                    color: mColors.secondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total spending",
                        style: TextStyle(
                          fontSize: 20,
                          color: mColors.secondaryColor,
                        ),
                      ),
                      Text(
                        "200000" + " Rs",
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.red,
                          fontFamily: 'Righteous',
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Earning",
                        style: TextStyle(
                          fontSize: 20,
                          color: mColors.secondaryColor,
                        ),
                      ),
                      Text(
                        "200000" + " Rs",
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.green,
                          fontFamily: 'Righteous',
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 20,
                          color: mColors.secondaryColor,
                        ),
                      ),
                      Text(
                        "200000" + " Rs",
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.green,
                          fontFamily: 'Righteous',
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
