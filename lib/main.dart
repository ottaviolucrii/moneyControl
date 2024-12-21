import 'package:flutter/material.dart';
import 'package:money_control/transaction.dart';

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
        title: Text('Money Control - Financial estability!'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          Column(
            children: _transactions.map((tr) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        tr.value.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tr.title,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              ),
                            Text(
                              tr.date.toString(),
                              style: TextStyle(
                                color: const Color.fromARGB(255, 110, 110, 110),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
