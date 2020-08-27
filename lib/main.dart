import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:mycards/models/credit_card.dart';
import 'package:mycards/widgets/add_new_card.dart';
import 'package:mycards/widgets/credit_card_back_widget.dart';
import 'package:mycards/widgets/credit_card_widget.dart';

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
      id: 'c2',
      title: 'EnCard',
      cardNumber: '12345678910111234',
      name: "FATİH KAAN SALGIR",
      date: "07/24",
      color: Colors.indigo,
      cvv: '123',
      background: Colors.green[700],
    ),
    CreditCard(
      id: 'c1',
      title: 'YapıKredi Play Card',
      cardNumber: '12345678910111234',
      name: "FATİH KAAN SALGIR",
      date: "07/24",
      color: Colors.orange,
      cvv: '123',
      background: Colors.yellow[700],
    ),
    CreditCard(
      id: 'c2',
      title: 'EnCard',
      cardNumber: '12345678910111234',
      name: "FATİH KAAN SALGIR",
      date: "07/24",
      cvv: '123',
      color: Colors.purple,
      background: Colors.deepOrange,
    ),
    CreditCard(
      id: 'c1',
      title: 'YapıKredi Play Card',
      cardNumber: '12345678910111234',
      name: "FATİH KAAN SALGIR",
      date: "07/24",
      cvv: '123',
      color: Colors.orange,
      background: Colors.deepPurple,
    ),
  ];

  void addCardToList(CreditCard c) {
    setState(() {
      _creditCards.add(c);
    });
  }

  void removeCardFromList(BuildContext context) {
    CreditCard backup = selectedCard;
    if (selectedCard != null) {
      setState(() {
        _creditCards.remove(selectedCard);
        selectedCard = null;
      });
    }
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Card is removed."),
      action: SnackBarAction(
        label: "Undo",
        onPressed: () => addCardToList(backup),
      ),
    ));
  }

  CreditCard selectedCard;

  void _selectCard(CreditCard c) {
    setState(() {
      selectedCard = c;
    });
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

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
              Visibility(
                child: GestureDetector(
                  onTap: () => cardKey.currentState.toggleCard(),
                  onHorizontalDragStart: (_) =>
                      cardKey.currentState.toggleCard(),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: FlipCard(
                      key: cardKey,
                      direction: FlipDirection.HORIZONTAL,
                      front: CreditCardWidget(selectedCard),
                      back: CreditCardBackWidget.noFunction(selectedCard),
                    ),
                  ),
                ),
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

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: () => startAddNewCard(context),
      ),

      // floatingActionButton: SpeedDial(
      //   // both default to 16
      //   marginRight: 18,
      //   marginBottom: 20,
      //   animatedIcon: AnimatedIcons.menu_close,
      //   animatedIconTheme: IconThemeData(size: 22.0),
      //   // this is ignored if animatedIcon is non null
      //   // child: Icon(Icons.add),
      //   visible: true,
      //   // If true user is forced to close dial manually
      //   // by tapping main button and overlay is not rendered.
      //   closeManually: false,
      //   curve: Curves.bounceIn,
      //   overlayColor: Colors.black,
      //   overlayOpacity: 0.5,
      //   onOpen: () => print('OPENING DIAL'),
      //   onClose: () => print('DIAL CLOSED'),
      //   tooltip: 'Menu',
      //   heroTag: 'speed-dial-hero-tag',
      //   backgroundColor: Colors.black,
      //   foregroundColor: Colors.white,
      //   elevation: 8.0,
      //   shape: CircleBorder(),
      //   children: [
      //     SpeedDialChild(
      //         child: Icon(Icons.add),
      //         backgroundColor: Colors.black,
      //         label: 'Add',
      //         labelStyle: TextStyle(fontSize: 18.0),
      //         onTap: () => startAddNewCard(context)),
      //     SpeedDialChild(
      //       child: Icon(Icons.delete),
      //       backgroundColor: Colors.black,
      //       label: 'Remove',
      //       labelStyle: TextStyle(fontSize: 18.0),
      //       onTap: () {
      //         removeCardFromList(context);
      //       },
      //     ),
      //   ],
      // ),
    );
  }

  startAddNewCard(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        builder: (_) {
          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.75,
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: NewCard(addCardToList),
            ),
          );
        });
  }
}
