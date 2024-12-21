import 'package:flutter/material.dart';
import 'package:money_control/transaction.dart';
import 'package:money_control/components/trasactions_list.dart';

main() {
  runApp(const MoneyControlApp());
}

class MoneyControlApp extends StatelessWidget {
  const MoneyControlApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});


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
    Transaction(
      id: 't3',
      title: 'Raqueteira',
      value: 950.00,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Money Control - Financial stability!'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Center(
                child: Text('Gráfico'),
              ),
              elevation: 5,
            ),
          ),

          TransactionList(_transactions),

          
        ],
      ),
    );
  }
}
