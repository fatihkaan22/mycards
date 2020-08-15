import 'package:flutter/material.dart';
import 'package:mycards/models/credit_card.dart';

import 'widgets/credit_card_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyCards',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<CreditCard> _creditCards = [
    CreditCard(
      id: 'c1',
      title: 'YapıKredi Play Card',
      cardNumber: '1234 5678 91011 1234',
      name: "Fatih Kaan Salgir",
      date: "07/24",
      color: Colors.orange,
      backgorund: Colors.black26, 
    ),
    CreditCard(
      id: 'c2',
      title: 'EnCard',
      cardNumber: '1234 5678 91011 1234',
      name: "Fatih Kaan Salgir",
      date: "07/24",
      color: Colors.purple,
      backgorund: Colors.white24, 
    ),
    CreditCard(
      id: 'c1',
      title: 'YapıKredi Play Card',
      cardNumber: '1234 5678 91011 1234',
      name: "Fatih Kaan Salgir",
      date: "07/24",
      color: Colors.orange,
      backgorund: Colors.black26, 
    ),
    CreditCard(
      id: 'c2',
      title: 'EnCard',
      cardNumber: '1234 5678 91011 1234',
      name: "Fatih Kaan Salgir",
      date: "07/24",
      color: Colors.purple,
      backgorund: Colors.white24, 
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyCards"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            CardList(_creditCards),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CreditCardList {}
