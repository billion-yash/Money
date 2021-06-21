import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:money/Design/mColors.dart';

class SummaryPage extends StatefulWidget {
  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  DocumentSnapshot monthly ,yearly;

  @override
  Widget build(BuildContext context) {
    monthlyData().then((value) {
      if (monthly == null) {
        setState(() {
          monthly = value;
        });
      }
    });
    yearlyData().then((value) {
      if (yearly == null) {
        setState(() {
          yearly = value;
        });
      }
    });
    if(monthly == null || yearly == null){
      return Container(
        alignment: Alignment.center,
        height:  MediaQuery.of(context).size.height*0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitDoubleBounce(
              color: mColors.secondaryColor,
            ),
            SizedBox(height: 15,),
            Text("Add transaction data from +" , style: TextStyle(fontSize: 20 , color: Colors.white54),)
          ],
        )
      );
    }

    return isPortrait(context)? portraitWidget() : landscapeWidget();
  }

  Widget portraitWidget(){
    return Container(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(20),
              color: mColors.primaryDarkColor,
              child: Container(
                padding: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width * 0.9,
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
                            getDataFromMonthly('spend').toString(),
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
                            getDataFromMonthly('earn').toString(),
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
                            (getDataFromMonthly('earn')-getDataFromMonthly('spend')).toString(),
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
                width: MediaQuery.of(context).size.width * 0.9,
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
                            getDataFromYearly('spend').toString() + " Rs",
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
                            getDataFromYearly('earn').toString() + " Rs",
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
                            (getDataFromYearly('earn') - getDataFromYearly('spend')).toString() + " Rs",
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
  Widget landscapeWidget(){
    return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              margin: EdgeInsets.all(20),
              color: mColors.primaryDarkColor,
              child: Container(
                padding: EdgeInsets.all(15),
                width: isPortrait(context)? MediaQuery.of(context).size.width*0.9 : MediaQuery.of(context).size.width*0.4,
                height: isPortrait(context)? MediaQuery.of(context).size.height*0.35 : MediaQuery.of(context).size.height*0.8,
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
                            getDataFromMonthly('spend').toString(),
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
                            getDataFromMonthly('earn').toString(),
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
                            (getDataFromMonthly('earn')-getDataFromMonthly('spend')).toString(),
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
                width: isPortrait(context)? MediaQuery.of(context).size.width*0.9 : MediaQuery.of(context).size.width*0.4,
                height: isPortrait(context)? MediaQuery.of(context).size.height*0.35 : MediaQuery.of(context).size.height*0.8,
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
                            getDataFromYearly('spend').toString() + " Rs",
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
                            getDataFromYearly('earn').toString() + " Rs",
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
                            (getDataFromYearly('earn') - getDataFromYearly('spend')).toString() + " Rs",
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





   Future<DocumentSnapshot> monthlyData() async{
    DocumentSnapshot d =   await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser.phoneNumber)
        .collection("transactions")
        .doc(DateTime.now().year.toString())
        .collection(DateTime.now().month.toString() + "summary")
        .doc("summary")
        .get().catchError((onError) {return null;});
    if(d.exists){
      return d;
    }
    return null;
  }
  Future<DocumentSnapshot> yearlyData() async{
    DocumentSnapshot d  =  await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser.phoneNumber)
        .collection("total")
        .doc("overall")
        .get().catchError((onError) {return null;});
    if(d.exists){
      return d;
    }
    return null;}

  int getDataFromMonthly(String s) {
    try{
      return monthly[s];
    }catch(error){
      return 0;
    }
  }
  int getDataFromYearly(String s) {
    try{
      return yearly[s];
    }catch(error){
      return 0;
    }
  }
  static bool isPortrait(context) {
    if(MediaQuery.of(context).orientation == Orientation.portrait){
      return true;
    }
    return false;
  }

}
