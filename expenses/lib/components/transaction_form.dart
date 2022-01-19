import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  TransactionForm();
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Titulo'),
              ),
              TextField(
                  controller: valueController,
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
        ));
  }
}