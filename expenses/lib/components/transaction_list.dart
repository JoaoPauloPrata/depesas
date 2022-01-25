import 'package:expenses/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this.transactions);

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 430,
      child: transactions.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Nenhum gasto cadastrado.',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final tr = transactions[index];
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 10,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('R\$${tr.value}'),
                        ),
                      ),
                    ),
                    title: Text(
                      tr.title,
                    ),
                    subtitle: Text(DateFormat('d MMM y').format(tr.date)),
                  ),
                );
              },
            ),
    );
  }
}
