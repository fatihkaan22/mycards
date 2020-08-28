import 'package:flutter/material.dart';
import 'package:mycards/models/credit_card.dart';

class AbstractCard extends StatelessWidget {
  static const double aspectRatioCard = 1.586;

  final CreditCard card;
  // final Function _selectCard;
  final List<Widget> children;
  final double elevation;

  AbstractCard({this.card, this.children, this.elevation = 0});

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
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    width: 2,
                    color: Colors.white38,
                  ),
                ),
                elevation: elevation,
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
