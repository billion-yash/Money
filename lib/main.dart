import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:money/Widgets/MainClassWidget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MainClass());
}

class MainClass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainState();
  }
}

class MainState extends State<MainClass> {
  bool _initialized = false;

  Future<void> initilizeFirebase() async {
    try {
      await Firebase.initializeApp();
      setState(() => _initialized = true);
    } catch (e) {}
  }

  @override
  void initState() {
    initilizeFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _initialized
        ? MainClassWidget()
        : MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text("Money"),
              ),
              body: Text("Loding"),
            ),
          );
  }
}
