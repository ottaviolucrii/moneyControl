import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit, {Key? key}) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
   DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;
    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value, _selectedDate!);
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).primaryColorDark, // Cor do cabeçalho
              onPrimary: Colors.white, // Cor do texto do cabeçalho
              onSurface: Theme.of(context).primaryColorDark,
              secondary:
                  Theme.of(context).primaryColorDark, // Cor do texto dos dias
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Colors.white, // Cor dos botões
              ),
            ),
            dialogBackgroundColor:
                Theme.of(context).primaryColorDark, // Cor de fundo do diálogo
          ),
          child: child!,
        );
      },
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          elevation: 5,
          child: Column(
            children: <Widget>[
              TextField(
                controller: _titleController,
                onSubmitted: (_) => _submitForm(),
                cursorColor: Theme.of(context).primaryColorDark,
                decoration: InputDecoration(
                  labelText: 'Título',
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                ),
              ),
              TextField(
                controller: _valueController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm(),
                cursorColor: Theme.of(context).primaryColorDark,
                decoration: InputDecoration(
                  labelText: 'Valor (R\$)',
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                ),
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        'Data Selecionada: ${DateFormat('dd/MM/y').format(_selectedDate)}',
                        style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Theme.of(context).primaryColorDark,
                      ),
                      child: Text(
                        'Selecionar Data',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: _showDatePicker,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: ElevatedButton(
                      child: Text('Nova Transação'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context)
                            .primaryColorDark, // Define a cor de fundo
                        foregroundColor: Colors.white, // Define a cor do texto
                      ),
                      onPressed: _submitForm,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
