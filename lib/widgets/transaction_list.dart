import 'package:flutter/material.dart';
import 'package:flutter_real_apps/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No Transaction',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 10,),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/boxes.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "Rp. ${transactions[index].amount.toStringAsFixed(2)}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.purple),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2)),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactions[index].title,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 4, 0, 0),
                            child: Text(
                              DateFormat.yMMMd()
                                  .format(transactions[index].dateTime),
                              style: TextStyle(color: Colors.green),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
