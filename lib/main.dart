import 'package:flutter/material.dart';

class MoneyControlApp extends StatelessWidget {
  const MoneyControlApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Money Control',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Money Control - Financial Management App'),
      ),
      body: const Center(
        child: Text('Hello, World!'),
      ),
    );
  }
}