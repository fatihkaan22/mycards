import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mycards/models/credit_card.dart';
import 'package:turkish/turkish.dart';

abstract class AbstractCard extends StatelessWidget {
  final CreditCard card;
  static const double aspectRatioCard = 1.586;
  final Function _selectCard;

  AbstractCard(this.card, this._selectCard);

  List<Widget> construct(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: aspectRatioCard,
            child: Container(
              width: double.infinity,
              child: Card(
                color: card.backgorund,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 30,
                margin: EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: construct(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
