import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function _addNewTransaction;

  NewTransaction(this._addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final title = titleController.text;
    final amount = amountController.text;
    if (title.isEmpty ||
        amount.isEmpty ||
        double.parse(amountController.text) <= 0) {
      //  invalid values
      return;
    }
    widget._addNewTransaction(
      titleController.text,
      double.parse(amountController.text),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: double.maxFinite,
              child: Text(
                "Add new transaction.",
                textAlign: TextAlign.center,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Title",
              ),
              onSubmitted: (_) => submitData(),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Amount",
              ),
              onSubmitted: (_) => submitData(),
              controller: amountController,
              keyboardType: TextInputType.number,
            ),
            TextButton(
              onPressed: submitData,
              child: Text("Add Transaction"),
            ),
          ],
        ),
      ),
    );
  }
}
