import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Year extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Year"),
      ),
      body: Container(
        height: 380,
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("users")
                .doc(FirebaseAuth.instance.currentUser.phoneNumber)
                .collection("transactions")
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final List<DocumentSnapshot> documents = snapshot.data.docs;
                return ListView(
                    children: documents
                        .map((doc) => ElevatedButton(onPressed: () { Navigator.pushNamed(context, '/home/year/month'  ,arguments: {"year" :doc.id});} ,child: Text(doc.id),))
                        .toList());
              } else if (snapshot.hasError) {
                return Text("It's Error!");
              }
              return Text("data");
            }),
      ),
    );
  }
}
