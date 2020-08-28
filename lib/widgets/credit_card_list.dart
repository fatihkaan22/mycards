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
      child: Card(
        elevation: 0,
        margin: EdgeInsets.only(left: 10, right: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ClipPath(
          clipper: ShapeBorderClipper(
              shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          )),
          child: SingleChildScrollView(
            child: ColumnSuper(
              innerDistance: -180,
              children: cards
                  .map(
                    (e) => InkWell(
                      onTap: () {
                        _selectCard(e);
                      },
                      child: CreditCardWidget(card: e),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
