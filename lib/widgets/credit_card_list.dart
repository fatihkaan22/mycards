import 'package:flutter/material.dart';

import 'package:mycards/models/credit_card.dart';
import 'package:mycards/widgets/credit_card_widget.dart';

class CardList extends StatelessWidget {
  final List<CreditCard> cards;

  CardList(this.cards);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: cards.map((e) => CreditCardWidget(e)).toList(),
    );
  }
}
