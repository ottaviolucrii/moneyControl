import 'dart:math';

import 'package:flutter/material.dart';
import './trasactions_list.dart';
import './transaction_form.dart';
import '../transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Nova raquete de Beach Tennis',
      value: 3750.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Nova camiseta da DropShot',
      value: 150.00,
      date: DateTime.now(),
    ),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionList(_transactions),
        TransactionForm(_addTransaction),
      ],
    );
  }
}