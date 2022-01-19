// ignore_for_file: avoid_unnecessary_containers

import 'package:expenses/model/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  ExpensesApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              child: Card(
            elevation: 5,
            color: Colors.blue,
            child: Text('Gráfico'),
          )),
          Column(
            children: _transactions_
                .map((tr) => Card(
                      child: Row(
                        children: [
                          Container(
                            // ignore: prefer_const_constructors
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              'R\$ ${tr.value.toStringAsFixed(2)}',
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tr.title,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                DateFormat('d MMM y').format(tr.date),
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      ),
                    ))
                .toList(),
          ),
          Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const TextField(
                      decoration: InputDecoration(labelText: 'Titulo'),
                    ),
                    const TextField(
                        decoration: InputDecoration(
                      labelText: 'Valor (R\$)',
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          child: const Text('Nova Transação'),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
