import 'package:flutter/material.dart';
import './components/transaction_form.dart';
import './components/trasactions_list.dart';
import '../transaction.dart';
import 'dart:math';
import './components/chart.dart';

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
              toolbarTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.white, // Cor do cursor
            selectionColor: Colors.blue[300], // Cor do retângulo de seleção
            selectionHandleColor: Theme.of(context).primaryColorDark, // Cor do handle de seleção
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
  final List <Transaction> _transactions = [];

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) {
        return tr.id == id;
      });
    });
  }

  List <Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
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
            Chart(_recentTransactions),
            TransactionList(_transactions, _removeTransaction),
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
