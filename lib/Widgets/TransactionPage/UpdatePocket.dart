import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:money/DataStructure/TransactionData.dart';

class UpdatePocket {
   static void addTransactionPocket(String title, double amt){
     final TransactionData td = TransactionData(title: title, amount: amt , id: DateTime.now());
     FirebaseFirestore.instance
         .collection("users")
         .doc(FirebaseAuth.instance.currentUser.phoneNumber)
         .collection("transactions")
         .doc(td.id.year.toString())
         .collection(td.id.month.toString())
         .doc(td.id.toString())
         .set({"spend" : td.amount , "title" : td.title} , SetOptions(merge: true));

     if(amt.isNegative){
       addSpendTransaction(title, (amt)*(-1), td);
     }
     else{
       addEarnedTransaction(title, amt, td);
     }

  }
    static void deleteTransaction(DocumentSnapshot doc){
      if((doc['spend'].toInt())<0){
        deleteSpendTransaction(doc);
      }
      else{
        deleteEarnedTransaction(doc);
      }
  }

  static void addSpendTransaction(String title, double amt , TransactionData td){

    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser.phoneNumber)
        .collection("total")
        .doc("overall")
        .set({"spend" : FieldValue.increment(amt.toInt())} , SetOptions(merge: true));

    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser.phoneNumber)
        .collection("transactions")
        .doc(td.id.year.toString());
    documentReference.set({});

        documentReference.collection(td.id.month.toString() + "summary")
        .doc("summary")
        .set({"spend" : FieldValue.increment(amt.toInt())} , SetOptions(merge: true));
   }

   static void addEarnedTransaction(String title, double amt, TransactionData td){
     FirebaseFirestore.instance
         .collection("users")
         .doc(FirebaseAuth.instance.currentUser.phoneNumber)
         .collection("total")
         .doc("overall")
         .set({"earn" : FieldValue.increment(amt.toInt())} , SetOptions(merge: true));

     DocumentReference documentReference = FirebaseFirestore.instance
         .collection("users")
         .doc(FirebaseAuth.instance.currentUser.phoneNumber)
         .collection("transactions")
         .doc(td.id.year.toString());

     documentReference..set({});
         documentReference.collection(td.id.month.toString() + "summary")
         .doc("summary")
         .set({"earn" : FieldValue.increment(amt.toInt())} , SetOptions(merge: true));
   }

   static void deleteSpendTransaction(DocumentSnapshot doc){
     DateTime dateTime = DateTime.parse(doc.id);
     FirebaseFirestore.instance
         .collection("users")
         .doc(FirebaseAuth.instance.currentUser.phoneNumber)
         .collection("total")
         .doc("overall")
         .set({"spend" : FieldValue.increment((doc['spend'].toInt())*(1))} , SetOptions(merge: true));

     FirebaseFirestore.instance
         .collection("users")
         .doc(FirebaseAuth.instance.currentUser.phoneNumber)
         .collection("transactions")
         .doc(dateTime.year.toString())
         .collection(dateTime.month.toString() + "summary")
         .doc("summary")
         .set({"spend" : FieldValue.increment((doc['spend'].toInt())*(1))} , SetOptions(merge: true));
   }

   static void deleteEarnedTransaction(DocumentSnapshot doc){
     DateTime dateTime = DateTime.parse(doc.id);


     FirebaseFirestore.instance
         .collection("users")
         .doc(FirebaseAuth.instance.currentUser.phoneNumber)
         .collection("total")
         .doc("overall")
         .set({"earn" : FieldValue.increment((doc['spend'].toInt())*(-1))} , SetOptions(merge: true));

     FirebaseFirestore.instance
         .collection("users")
         .doc(FirebaseAuth.instance.currentUser.phoneNumber)
         .collection("transactions")
         .doc(dateTime.year.toString())
         .collection(dateTime.month.toString() + "summary")
         .doc("summary")
         .set({"earn" : FieldValue.increment((doc['spend'].toInt())*(-1))} , SetOptions(merge: true));
   }
}
