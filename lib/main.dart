import 'package:flutter/material.dart';
import 'package:mycards/models/credit_card.dart';
import 'package:mycards/widgets/credit_card_widget.dart';

import 'widgets/credit_card_list.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
      cardNumber: '1234 5678 91011 1234',
      name: "Fatih Kaan Salgir",
      date: "07/24",
      color: Colors.orange,
      backgorund: Colors.red[700],
    ),
    CreditCard(
      id: 'c2',
      title: 'EnCard',
      cardNumber: '1234 5678 91011 1234',
      name: "Fatih Kaan Salgir",
      date: "07/24",
      color: Colors.purple,
      backgorund: Colors.deepOrange,
    ),
    CreditCard(
      id: 'c1',
      title: 'YapıKredi Play Card',
      cardNumber: '1234 5678 91011 1234',
      name: "Fatih Kaan Salgir",
      date: "07/24",
      color: Colors.orange,
      backgorund: Colors.deepPurple,
    ),
    CreditCard(
      id: 'c2',
      title: 'EnCard',
      cardNumber: '1234 5678 91011 1234',
      name: "Fatih Kaan Salgir",
      date: "07/24",
      color: Colors.purple,
      backgorund: Colors.pink[700],
    ),
    CreditCard(
      id: 'c1',
      title: 'Akbank',
      cardNumber: '1234 5678 91011 1234',
      name: "Fatih Kaan Salgir",
      date: "07/24",
      color: Colors.orange,
      backgorund: Colors.red[700],
    ),
    CreditCard(
      id: 'c2',
      title: 'Deneme',
      cardNumber: '1234 5678 91011 1234',
      name: "Fatih Kaan Salgir",
      date: "07/24",
      color: Colors.blue,
      backgorund: Colors.orange[700],
    ),
    CreditCard(
      id: 'c1',
      title: 'YapıKredi Play Card',
      cardNumber: '1234 5678 91011 1234',
      name: "Fatih Kaan Salgir",
      date: "07/24",
      color: Colors.amber,
      backgorund: Colors.blue[700],
    ),
    CreditCard(
      id: 'c2',
      title: 'EnCard',
      cardNumber: '1234 5678 91011 1234',
      name: "Fatih Kaan Salgir",
      date: "07/24",
      color: Colors.indigo,
      backgorund: Colors.green[700],
    ),
    CreditCard(
      id: 'c1',
      title: 'YapıKredi Play Card',
      cardNumber: '1234 5678 91011 1234',
      name: "Fatih Kaan Salgir",
      date: "07/24",
      color: Colors.orange,
      backgorund: Colors.red[700],
    ),
    CreditCard(
      id: 'c2',
      title: 'EnCard',
      cardNumber: '1234 5678 91011 1234',
      name: "Fatih Kaan Salgir",
      date: "07/24",
      color: Colors.purple,
      backgorund: Colors.deepOrange,
    ),
    CreditCard(
      id: 'c1',
      title: 'YapıKredi Play Card',
      cardNumber: '1234 5678 91011 1234',
      name: "Fatih Kaan Salgir",
      date: "07/24",
      color: Colors.orange,
      backgorund: Colors.deepPurple,
    ),
    CreditCard(
      id: 'c2',
      title: 'EnCard',
      cardNumber: '1234 5678 91011 1234',
      name: "Fatih Kaan Salgir",
      date: "07/24",
      color: Colors.purple,
      backgorund: Colors.pink[700],
    ),
    CreditCard(
      id: 'c1',
      title: 'Akbank',
      cardNumber: '1234 5678 91011 1234',
      name: "Fatih Kaan Salgir",
      date: "07/24",
      color: Colors.orange,
      backgorund: Colors.red[700],
    ),
    CreditCard(
      id: 'c2',
      title: 'Deneme',
      cardNumber: '1234 5678 91011 1234',
      name: "Fatih Kaan Salgir",
      date: "07/24",
      color: Colors.blue,
      backgorund: Colors.orange[700],
    ),
    CreditCard(
      id: 'c1',
      title: 'YapıKredi Play Card',
      cardNumber: '1234 5678 91011 1234',
      name: "Fatih Kaan Salgir",
      date: "07/24",
      color: Colors.amber,
      backgorund: Colors.blue[700],
    ),
    CreditCard(
      id: 'c2',
      title: 'EnCard',
      cardNumber: '1234 5678 91011 1234',
      name: "Fatih Kaan Salgir",
      date: "07/24",
      color: Colors.indigo,
      backgorund: Colors.green[700],
    ),
  ];

  CreditCard selectedCard;

  void _selectCard(CreditCard c) {
    setState(() {
      selectedCard = c;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyCards"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (selectedCard != null) CreditCardWidget(selectedCard, _selectCard),
          Container(
              margin: EdgeInsets.all(5),
              alignment: Alignment.topLeft,
              child: Text(
                'Wallet',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              )),
          CardList(_creditCards, _selectCard),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//   color: Colors.black,
//   child: Swiper(
//     itemBuilder: (BuildContext context, int index) {
//       return CreditCardWidget(_creditCards[index]);
//     },
//     itemCount: _creditCards.length,
//     pagination: SwiperPagination(
//         builder: SwiperPagination.fraction,
//         alignment: Alignment.topRight),
//     // control: SwiperControl(),
//     scrollDirection: Axis.vertical,
//     itemWidth: 400,
//     itemHeight: 500,
//     layout: SwiperLayout.CUSTOM,
//     customLayoutOption: CustomLayoutOption(
//       startIndex: 0,
//       stateCount: 8,
//       // ).addRotate(
//       //   [
//       //     // rotation of every item
//       //     -45.0 / 180,
//       //     0.0,
//       //     45.0 / 180
//       //   ],
//     )
//         .addTranslate(
//           [
//             Offset(0, 0),
//             Offset(0, 50.0),
//             Offset(0, 100.0),
//             Offset(0, 150.0),
//             Offset(0, 200.0),
//             Offset(0, 250.0),
//             Offset(0, 300.0),
//             Offset(0, 350.0),
//           ],
//         )
//         .addOpacity(
//           List.from(List<double>.generate(
//               _creditCards.length, (index) => 1 - index * 0.1).reversed),
//           // [0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1],
//         )
//         .addScale(
//           List.from(List<double>.generate(
//               _creditCards.length, (index) => 1 - index * 0.05).reversed),
//           Alignment.center,
//         ),
//   ),
// ),
