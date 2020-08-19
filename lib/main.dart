import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mycards/models/credit_card.dart';
import 'package:mycards/widgets/credit_card_widget.dart';
import 'package:mycards/widgets/selected_widget.dart';

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
        // primarySwatch: Colors.blueGrey,
        primaryColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CreditCard> _creditCards = [
    CreditCard(
      id: 'c1',
      title: 'YapıKredi Play Card',
      cardNumber: '12345678910111234',
      name: "FATİH KAAN SALGIR",
      date: "07/24",
      color: Colors.amber,
      cvv: '123',
      backgorund: Colors.blue[700],
    ),
    CreditCard(
      id: 'c2',
      title: 'EnCard',
      cardNumber: '12345678910111234',
      name: "FATİH KAAN SALGIR",
      date: "07/24",
      color: Colors.indigo,
      cvv: '123',
      backgorund: Colors.green[700],
    ),
    CreditCard(
      id: 'c1',
      title: 'YapıKredi Play Card',
      cardNumber: '12345678910111234',
      name: "FATİH KAAN SALGIR",
      date: "07/24",
      color: Colors.orange,
      cvv: '123',
      backgorund: Colors.red[700],
    ),
    CreditCard(
      id: 'c2',
      title: 'EnCard',
      cardNumber: '12345678910111234',
      name: "FATİH KAAN SALGIR",
      date: "07/24",
      cvv: '123',
      color: Colors.purple,
      backgorund: Colors.deepOrange,
    ),
    CreditCard(
      id: 'c1',
      title: 'YapıKredi Play Card',
      cardNumber: '12345678910111234',
      name: "FATİH KAAN SALGIR",
      date: "07/24",
      cvv: '123',
      color: Colors.orange,
      backgorund: Colors.deepPurple,
    ),
    CreditCard(
      id: 'c2',
      title: 'EnCard',
      cardNumber: '12345678910111234',
      name: "FATİH KAAN SALGIR",
      date: "07/24",
      cvv: '123',
      color: Colors.purple,
      backgorund: Colors.pink[700],
    ),
    CreditCard(
      id: 'c1',
      title: 'Akbank',
      cardNumber: '12345678910111234',
      name: "FATİH KAAN SALGIR",
      date: "07/24",
      cvv: '123',
      color: Colors.orange,
      backgorund: Colors.red[700],
    ),
    CreditCard(
      id: 'c2',
      title: 'Deneme',
      cardNumber: '12345678910111234',
      name: "FATİH KAAN SALGIR",
      date: "07/24",
      cvv: '123',
      color: Colors.blue,
      backgorund: Colors.orange[700],
    ),
    CreditCard(
      id: 'c1',
      title: 'YapıKredi Play Card',
      cardNumber: '12345678910111234',
      name: "Fatih Kaan Salgır",
      date: "07/24",
      cvv: '123',
      color: Colors.amber,
      backgorund: Colors.blue[700],
    ),
    CreditCard(
      id: 'c2',
      title: 'EnCard',
      cardNumber: '12345678910111234',
      name: "Fatİh Kaan Salgır",
      date: "07/24",
      cvv: '123',
      color: Colors.indigo,
      backgorund: Colors.green[700],
    ),
  ];

  CreditCard selectedCard;
  bool _frontFace;

  void _selectCard(CreditCard c) {
    setState(() {
      selectedCard = c;
      _frontFace = true;
    });
  }

  void _turnCard() {
    print("drag");
    setState(() {
      if (_frontFace)
        _frontFace = false;
      else
        _frontFace = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("MyCards"),
      // ),
      body: Container(
        color: Colors.white54,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (selectedCard != null)
              Container(
                margin: EdgeInsets.all(10),
                child: SelectedCardWidget(
                    selectedCard, _selectCard, _turnCard, _frontFace),
              ),
            Container(
                margin: EdgeInsets.only(
                  left: 20,
                  top: 5,
                ),
                alignment: Alignment.topLeft,
                child: Text(
                  'Wallet',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(0.0, 10.0),
                        blurRadius: 70.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                  ),
                )),
            CardList(_creditCards, _selectCard),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        // both default to 16
        marginRight: 18,
        marginBottom: 20,
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0),
        // this is ignored if animatedIcon is non null
        // child: Icon(Icons.add),
        visible: true,
        // If true user is forced to close dial manually
        // by tapping main button and overlay is not rendered.
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        onOpen: () => print('OPENING DIAL'),
        onClose: () => print('DIAL CLOSED'),
        tooltip: 'Menu',
        heroTag: 'speed-dial-hero-tag',
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 8.0,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
              child: Icon(Icons.add),
              backgroundColor: Colors.red,
              label: 'Add',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => print('FIRST CHILD')),
          SpeedDialChild(
            child: Icon(Icons.brush),
            backgroundColor: Colors.blue,
            label: 'Edit',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => print('SECOND CHILD'),
          ),
        ],
      ),
      //add new card
      //edit card
    );
  }
}
