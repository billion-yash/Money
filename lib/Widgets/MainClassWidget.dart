import 'package:flutter/material.dart';
import 'package:money/Design/mColors.dart';
import 'package:money/Widgets/SummaryPage/SummaryPage.dart';
import 'package:money/Widgets/User/CurrentUser.dart';
import 'TransactionPage/AddTransactionPage.dart';

class MainClassWidget extends StatefulWidget {
  @override
  _MainClassWidgetState createState() => _MainClassWidgetState();
}

class _MainClassWidgetState extends State<MainClassWidget> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {


    List<Widget> _widgetOptions = <Widget>[
      AddTransactionPage(),
      SummaryPage(),
      CurrentUser(),
    ];

    return Scaffold(
      backgroundColor: mColors.primaryColor,

      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: mColors.primaryDarkColor,
        centerTitle: true,
        title: Text("Money", style: TextStyle(color: mColors.secondaryColor,fontFamily: 'Righteous' , fontSize: 25 , letterSpacing: 5)),
      ),
      body: SingleChildScrollView(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: mColors.primaryDarkColor,
        unselectedItemColor: Colors.white70,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Transactions",
            backgroundColor: mColors.secondaryColor
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.poll_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: "User",
          ),
        ],
        elevation: 5,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        iconSize: 30,
        selectedItemColor: mColors.secondaryColor,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
