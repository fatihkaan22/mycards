import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mycards/models/credit_card.dart';
import 'package:mycards/widgets/abstract_card.dart';

class CreditCardBackWidget extends StatelessWidget {
  final CreditCard card;
  final double elevation;

  CreditCardBackWidget({this.card, Function selectCard, this.elevation = 0});

  void cvvClipboard(BuildContext context) {
    Scaffold.of(context).removeCurrentSnackBar();
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("CVV copied to clipboard."),
    ));
    Clipboard.setData(ClipboardData(text: card.cvv));
  }

  @override
  Widget build(BuildContext context) {
    return AbstractCard(
      elevation: elevation,
      card: card,
      children: [
        Flexible(
          flex: 12,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: card.color,
                width: 3,
              ),
              color: card.color,
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),
            margin: EdgeInsets.only(left: 4, right: 4, top: 4),
            padding: EdgeInsets.all(5),
            child: Text(
              card.title,
              style: TextStyle(
                color: card.titleColor,
                fontSize: 18,
              ),
            ),
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          flex: 12,
          child: FractionallySizedBox(
            heightFactor: 0.9,
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black45,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 12,
          child: InkWell(
            onTap: () => cvvClipboard(context),
            onLongPress: () => cvvClipboard(context),
            child: Container(
              alignment: Alignment.center,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(),
                    Text(
                      card.cvv,
                      style: TextStyle(
                        color: card.textColor,
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ]),
            ),
          ),
        ),
        Flexible(
          flex: 18,
          child: Container(),
        )
      ],
    );
  }
}
