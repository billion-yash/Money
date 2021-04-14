import 'package:flutter/material.dart';
import './TrasactionPage/AddTrasactionPage.dart';

class MainClassWidget extends StatefulWidget {
  @override
  _MainClassWidgetState createState() => _MainClassWidgetState();
}

class _MainClassWidgetState extends State<MainClassWidget> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    AddTransactionPage(),
    Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Money"),
        ),
        body: SingleChildScrollView(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: "Transactions",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.login),
              label: "Login",
            ),
          ],
          elevation: 5,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          iconSize: 30,
          selectedItemColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
