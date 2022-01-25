import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;
  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  _submitForm() {
    final title = _titleController.text;
    final date = _selectedDate;
    final value = double.tryParse(_valueController.text) ?? 0.0;
    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value, date);
  }

  var _selectedDate;

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
      ;
    });
  }

  final _titleController = TextEditingController();

  final _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Titulo'),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: _valueController,
                onSubmitted: (_) => _submitForm(),
                decoration: const InputDecoration(
                  labelText: 'Valor (R\$)',
                ),
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    _selectedDate == null
                        ? Text('Nenhuma data selecionada')
                        : Text(DateFormat('d/M/y').format(_selectedDate)),
                    SizedBox(
                      width: 40,
                    ),
                    TextButton(
                      child: Text(
                        'Selecionar Data',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: _showDatePicker,
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
