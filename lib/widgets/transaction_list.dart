// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:daily_expenses_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'new_transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTx;

  TransactionList(this.transaction, this.deleteTx);
 
@override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
        child: transaction.isEmpty? Column(
          children: <Widget>[
            Text('Waiting for the transactions',
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height:200,
              child:Image.asset(
                'assets/waiting.png',
                fit: BoxFit.cover,
                ),
            ),
            ],
          ) 
        : ListView.builder(
          itemBuilder: (ctx, index) {
            return ListTile(
              leading: CircleAvatar(
                radius: 30,
              child: Padding(
                padding: EdgeInsets.all(6),
                child: FittedBox(
                  child: Text('\$${transaction[index].amount}'),
                  ),
              ),
              ),
              title: Text(transaction[index].title,
              ),
              subtitle: Text(
                DateFormat.yMMMd().format(transaction[index].date),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              color:Colors.redAccent,
              onPressed: () {
                
              },
              ),
            );
          },
          itemCount: transaction.length,
         ),
        );
      
   }
}