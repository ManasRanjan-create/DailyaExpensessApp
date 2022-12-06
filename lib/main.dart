// ignore_for_file: deprecated_member_use, sized_box_for_whitespace, prefer_const_constructors, use_key_in_widget_constructors

import 'package:daily_expenses_app/models/transaction.dart';
import 'package:daily_expenses_app/widgets/new_transaction.dart';
import 'package:daily_expenses_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:daily_expenses_app/widgets/chart.dart';


void main() =>  runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.blueAccent,

      ),
      home:MyHomePage(),
    );
  }
}
class MyHomePage  extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
  
class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [
  
];
// final titleController = TextEditingController();
//final amountController = TextEditingController();
 final List<Transaction> _userTransactions = [
   //Transaction(
   //id: 't1', 
   // title: 'New Shoes', 
   // amount: 69.99, 
   // date: DateTime.now(),
   // ),
   // Transaction(
   //   id: 't2', 
   //   title: 'New Shirt', 
   // amount: 199.99, 
   //   date: DateTime.now(),
   //),
  ];
  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }
  void _addNewTransaction(String txTitle, double txAmount,
  DateTime chosenDate) {
    final newTx = Transaction(
      title: txTitle, 
      amount: txAmount,
      date: chosenDate,
      id: DateTime.now().toString()
      );
      setState(() {
        _userTransactions.add(newTx);
      });

 void startAddNewTransaction(BuildContext ctx){
   showModalBottomSheet(
     context: ctx, builder: (_) {
       onTap: () {};
     return GestureDetector(
       child:NewTransaction(_addNewTransaction),
       behavior: HitTestBehavior.opaque,
       );
   },
   );
 }
 void _deleteTransaction(String id) {
   setState(() {
     _userTransactions.removeWhere((tx) {
       return tx.id ==id;
     });
   });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add,),
          onPressed: () => startAddNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          Chart(_recentTransactions),
          TransactionList(_userTransactions, _deleteTransaction)
          ],
        ),
      ),
      floatingActionButtonLocation: 
      FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child:Icon(Icons.add),
        onPressed: () => startAddNewTransaction(context),
      ),
    );
  }

_startAddNewTransaction(BuildContext context) {
}
}
@override
State<StatefulWidget> createState() {
  // TODO: implement createState
  throw UnimplementedError();
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}