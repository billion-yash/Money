import 'package:flutter/material.dart';
import 'package:money/Widgets/User/CurrentUser.dart';
import 'TransactionPage/AddTransactionPage.dart';

class MainClassWidget extends StatefulWidget {
  final Function getUser;
  MainClassWidget(this.getUser);
  @override
  _MainClassWidgetState createState() => _MainClassWidgetState(getUser);
}

class _MainClassWidgetState extends State<MainClassWidget> {
  int _selectedIndex = 0;

  Function getUser;
  _MainClassWidgetState(this.getUser);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      AddTransactionPage(),
      Text('Search Page',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
      CurretUser(getUser),
    ];
    return Scaffold(
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
            icon: Icon(Icons.supervised_user_circle),
            label: "User",
          ),
        ],
        elevation: 5,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        iconSize: 30,
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
