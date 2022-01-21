// ignore_for_file: avoid_unnecessary_containers

import 'dart:math';

import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'components/transaction_list.dart';
import 'model/transaction.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  ExpensesApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.amber,
          fontFamily: 'Quicksand'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions_ = [
    Transaction(
        id: 't1',
        title: 'Novo Tênis da Nikeeee',
        value: 254.56,
        date: DateTime.now().subtract(Duration(days: 3))),
    Transaction(
        id: 't3',
        title: 'Pastel iaiade',
        value: 254.56,
        date: DateTime.now().subtract(Duration(days: 3))),
    Transaction(
        id: 't4',
        title: 'Pinga Agatao',
        value: 254.56,
        date: DateTime.now().subtract(Duration(days: 33))),
    Transaction(
        id: 't2',
        title: 'Conta de Luz da Cemig',
        value: 150.2,
        date: DateTime.now()),
  ];

  List<Transaction> get _recentTransactions {
    return _transactions_.where((transaction) {
      return transaction.date
          .isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now());
    setState(() {
      _transactions_.add(newTransaction);
    });
    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => _openTransactionFormModal(context),
              icon: Icon(Icons.add))
        ],
        title: const Text('Despesas Pessoais'),
      ),
      body: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(child: Chart(_recentTransactions)),
          TransactionList(_transactions_),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
