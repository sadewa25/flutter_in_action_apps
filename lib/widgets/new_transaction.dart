import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleInput = TextEditingController();
  final _amount = TextEditingController();

  void submitData() {
    final enteredTitle = _titleInput.text;
    final enteredAmount = double.parse(_amount.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleInput,
              onSubmitted: (_) => submitData(),
              /*onChanged: (value) {
                      _titleInput = value;
                    }*/
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amount,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              /*onChanged: (value) {
                      _amount = value;
                    }*/
            ),
            FlatButton(
              onPressed: submitData,
              child: Text('Add Transaction'),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
