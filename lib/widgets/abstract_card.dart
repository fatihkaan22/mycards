import 'package:flutter/material.dart';
import 'package:mycards/models/credit_card.dart';

class AbstractCard extends StatelessWidget {
  static const double aspectRatioCard = 1.586;

  final CreditCard card;
  // final Function _selectCard;
  final List<Widget> children;

  AbstractCard({this.card, this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: AbstractCard.aspectRatioCard,
            child: Container(
              width: double.infinity,
              child: Card(
                color: card.background,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 30,
                margin: EdgeInsets.only(bottom: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: children),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
