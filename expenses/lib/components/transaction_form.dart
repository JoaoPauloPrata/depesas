import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;
  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;
    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value);
  }

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
                decoration: const InputDecoration(labelText: 'Titulo'),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: valueController,
                onSubmitted: (_) => _submitForm(),
                decoration: const InputDecoration(
                  labelText: 'Valor (R\$)',
                ),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Text('Nenhuma data selecionada!'),
                    SizedBox(
                      width: 40,
                    ),
                    TextButton(
                      child: Text(
                        'Selecionar Data',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      child: const Text('Nova Transação'),
                      onPressed: _submitForm),
                ],
              )
            ],
          ),
        ));
  }
}
