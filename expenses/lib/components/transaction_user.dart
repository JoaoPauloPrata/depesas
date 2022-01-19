import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';
import '../model/transaction.dart';

class TransactionUser extends StatefulWidget {
  TransactionUser();

  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions_ = [
    Transaction(
        id: 't1',
        title: 'Novo Tênis da Nikeeee',
        value: 254.56,
        date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Conta de Luz da Cemig',
        value: 150.2,
        date: DateTime.now()),
  ];
  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now());
    setState(() {
      _transactions_.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(_addTransaction),
        TransactionList(_transactions_),
      ],
    );
  }
}
