import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';

import 'package:mycards/models/credit_card.dart';
import 'package:mycards/widgets/credit_card_widget.dart';
import 'dart:math' as math;

class CardList extends StatelessWidget {
  final List<CreditCard> cards;
  Function _selectCard;

  CardList(this.cards, this._selectCard);

  @override
  Widget build(BuildContext context) {
    if (cards.isEmpty) {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Text(
              "No cards added yet!",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
          ),
          Transform.rotate(
            angle: -math.pi / 12,
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.only(right: 40),
              child: Icon(
                Icons.credit_card,
                size: 50,
                color: Colors.black54,
              ),
            ),
          ),
          Transform.rotate(
            angle: math.pi / 12,
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.only(left: 40),
              child: Icon(
                Icons.credit_card,
                size: 50,
                color: Colors.black54,
              ),
            ),
          ),
          Transform.rotate(
            angle: math.pi / 26,
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.credit_card,
                size: 50,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      );
    }

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
