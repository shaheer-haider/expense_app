import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import './../models/transaction.dart';

class TransactionCard extends StatelessWidget {
  final Transaction trans;
  TransactionCard(this.trans);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.all(5),
        elevation: 5,
        shadowColor: Theme.of(context).primaryColorLight,
        child: InkWell(
          onTap: () {},
          child: Row(
            children: [
              // Amount Round Container
              Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.fromLTRB(10, 10, 20, 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  "\$${trans.amount.toStringAsFixed(2)}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              // Name and Date
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trans.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: "${GoogleFonts.varelaRound()}",
                    ),
                  ),
                  Text(DateFormat.yMMMd().format(trans.date)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
