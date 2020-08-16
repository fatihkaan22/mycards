import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';

import 'package:mycards/models/credit_card.dart';
import 'package:mycards/widgets/credit_card_widget.dart';

class CardList extends StatelessWidget {
  final List<CreditCard> cards;
  Function _selectCard;

  CardList(this.cards, this._selectCard);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SingleChildScrollView(
        child: ColumnSuper(
          innerDistance: -200,
          children: cards.map((e) => CreditCardWidget(e, _selectCard)).toList(),
        ),
      ),
    );
  }
}
