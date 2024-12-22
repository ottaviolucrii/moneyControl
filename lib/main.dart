import 'package:flutter/material.dart';
import './components/transaction_form.dart';
import './components/trasactions_list.dart';
import '../transaction.dart';
import 'dart:math';

main() {
  runApp(const MoneyControlApp());
}

class MoneyControlApp extends StatelessWidget {
  const MoneyControlApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColorDark: Colors.blue[900],
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          titleTextStyle: 
              TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        home: HomePage(),
      );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

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

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Money Control  💳'),
        titleTextStyle: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).primaryColorDark,
        actions: <Widget>[
          IconButton(
            color: Colors.white,
            onPressed: () => _openTransactionFormModal(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Theme.of(context).primaryColorDark,
                child: Center(
                  child: Text(
                    'Gráfico',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                elevation: 5,
              ),
            ),
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColorDark,
        onPressed: () => _openTransactionFormModal(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
