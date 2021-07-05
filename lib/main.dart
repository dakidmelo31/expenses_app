import 'dart:ffi';

import 'package:expenses/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cash Flo",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Startup extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 35.0),
            child:
            Text("This should be the perfect way to see money from an everyday payment perspective. Look into the future and see the now now")),
          Row(
            children: [
              RaisedButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen())); }, child: Text("Next"),)
            ],

          )

        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget{
  final List<Transaction> transactions = [
    Transaction(id: 't1', title: "New Shoes", amount: 12500, date: DateTime.now()),
    Transaction(id: 't2', title: "Couples Goal", amount: 15000, date: DateTime.now()),
    Transaction(id: 't3', title: "SugarBox", amount: 200, date: DateTime.now()),
    Transaction(id: 't4', title: "Yellow Pullover", amount: 9000, date: DateTime.now()),
    Transaction(id: 't5', title: "48 Spices Food", amount: 2500, date: DateTime.now()),
    Transaction(id: 't6', title: "Taxi Fare", amount: 500, date: DateTime.now()),
    Transaction(id: 't7', title: "Robbing Oil", amount: 3200, date: DateTime.now()),
  ];
Widget btner(){
  return Text("How are you seeing this?");
}
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Expense"),
      // ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              child: IconButton(onPressed: (){counter++;}, icon: Icon(Icons.home, color: Color.fromARGB(255, 20, 230, 170), size: 34.0)),
              splashColor: Colors.lightGreenAccent,
            ),
            InkWell(
              child: IconButton(onPressed: (){counter++;}, icon: Icon(Icons.notifications, color: Color.fromARGB(255, 20, 230, 170), size: 34.0)),
              splashColor: Colors.lightGreenAccent,
            ),
            InkWell(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 30),
                child:  IconButton(onPressed: (){counter++;}, icon: Icon(Icons.add, color: Colors.blue, size: 44.0)),
              ),
              splashColor: Colors.lightGreenAccent,
            ),
            InkWell(
              child: IconButton(
                  highlightColor: Colors.yellow,
                  onPressed: (){
                counter = counter +1;
              }, icon: Icon(Icons.attach_money,  color: Color.fromARGB(255, 20, 230, 170), size: 34.0,)),
              splashColor: Colors.lightGreenAccent,
            ),
            InkWell(
              child: IconButton(onPressed: (){counter++;},
                  enableFeedback: true,
                  icon: Icon(Icons.settings,  color: Color.fromARGB(255, 20, 230, 170), size: 34.0)),
              splashColor: Colors.black,
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 100,
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Container(
              width: double.infinity,
              color: Colors.blue,
              child: Text("Chart!!!"),
            ),
            elevation: 15,
          ),
          Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                TextField(autocorrect: true, cursorColor: Colors.blue, cursorWidth: 2, decoration: InputDecoration(labelText: "Title"),),
                TextField(autocorrect: true, cursorColor: Colors.blue, cursorWidth: 2, decoration: InputDecoration(labelText: "Amount"),),
                  RaisedButton(onPressed: (){}, child: Text("Add Now", style: TextStyle(color: Colors.white ),),color: Colors.blue)
            ],
          ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: transactions.map((tx){
              return GestureDetector(
                onLongPress: (){ final String me = "hold me now";},
                child: InkWell(
                  child: Card(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    elevation: 25,
                    shadowColor: Color.fromARGB(55, 210, 210, 210),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Color.fromARGB(255, 20, 230, 170)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                            padding: EdgeInsets.all(5),
                            child: Text("${tx.amount} XAF",
                              style: TextStyle(color: Color.fromARGB(255, 20, 230, 170),
                                               fontSize: 14,
                                               fontWeight: FontWeight.bold),
                            )
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(tx.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),),
                              Text(DateFormat.yMMMMd().format(tx.date), style: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),),
                            ],
                          ),
                          IconButton(onPressed: (){String me = "how";}, icon: Icon(Icons.delete, color: Colors.red,))
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}