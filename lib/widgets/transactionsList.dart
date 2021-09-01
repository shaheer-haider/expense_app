import 'package:flutter/material.dart';

import './transactionCard.dart';

class TransactionsList extends StatelessWidget {
  final List transactions;
  TransactionsList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "No Transactions Added",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return TransactionCard(transactions[index]);
              },
              itemCount: transactions.length,
            ),
    );
  }
}
