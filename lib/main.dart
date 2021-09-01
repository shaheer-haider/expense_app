import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/charts.dart';
import './widgets/newTransaction.dart';
import './widgets/transactionsList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expensia',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.pink,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _transactions = [];

  void _addNewTransaction(String title, double amount) {
    setState(() {
      _transactions.add(
        Transaction(
          id: "id7",
          title: title,
          amount: amount,
          date: DateTime.now(),
        ),
      );
    });
  }

  void _showAddTransactionModal(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (buildCTX) => NewTransaction(_addNewTransaction),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expensia"),
        actions: [
          IconButton(
            onPressed: () => {_showAddTransactionModal(context)},
            icon: Icon(
              Icons.add,
            ),
          )
        ],
        elevation: 10,
        backgroundColor: Theme.of(context).primaryColorDark,
        shadowColor: Theme.of(context).primaryColorLight,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Charts(),
            TransactionsList(_transactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: () => {_showAddTransactionModal(context)},
          child: Icon(
            Icons.add,
          )),
    );
  }
}
