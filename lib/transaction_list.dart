import 'dart:ui';

import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  "No transaction is added yet",
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/sample_image3.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 6,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                              child: Text(
                                  "₹:" + "${transactions[index].amount}"))),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () => deleteTx(transactions[index].id),
                    ),
                  ),
                );
                // return Card(
                //     child: Row(
                //   children: [
                //     Container(
                //       margin: EdgeInsets.symmetric(
                //         vertical: 10,
                //         horizontal: 15,
                //       ),
                //       child: Text(
                //         "₹:" + "${transactions[index].amount}",
                //         style: TextStyle(
                //           fontFamily: 'Open Sans',
                //           fontWeight: FontWeight.bold,
                //           fontSize: 18,
                //           color: Theme.of(context).primaryColor,
                //         ),
                //       ),
                //       decoration: BoxDecoration(
                //         border: Border.all(
                //             color: Theme.of(context).primaryColor, width: 2),
                //       ),
                //       padding: EdgeInsets.all(10),
                //     ),
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: <Widget>[
                //         Text(
                //           transactions[index].title,
                //           style: TextStyle(
                //             fontFamily: 'Open Sans',
                //             fontWeight: FontWeight.bold,
                //             fontSize: 18,
                //           ),
                //         ),
                //         Text(
                //           DateFormat.yMMMd().format(transactions[index].date),
                //           style: TextStyle(
                //             color: Colors.grey,
                //           ),
                //         ),
                //       ],
                //     )
                //   ],
                // ));
              },
              itemCount: transactions.length,
            ),
    );
  }
}
