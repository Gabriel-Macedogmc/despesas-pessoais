import 'package:despesas_pessoais/components/adaptative_button.dart';
import 'package:despesas_pessoais/components/adaptative_date_picker.dart';
import 'package:despesas_pessoais/components/adaptative_text_field.dart';
import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitFomr() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }

    widget.onSubmit(title, value, _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          AdapTativeTextField(
            label: 'Título',
            controller: _titleController,
            onSubmit: (_) => _submitFomr(),
          ),
          AdapTativeTextField(
            label: 'Valor (R\$)',
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            controller: _valueController,
            onSubmit: (_) => _submitFomr(),
          ),
          AdaptativeDatePicker(
            selectedDate: _selectedDate,
            onDateChanged: (newDate) => setState(() {
              _selectedDate = newDate;
            }),
          ),
          // ignore: deprecated_member_use
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AdaptativeButton(
                label: 'Nova Transação',
                onPressed: _submitFomr,
              )
            ],
          )
        ],
      ),
    );
  }
}
