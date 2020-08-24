import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mycards/models/credit_card.dart';
import 'package:mycards/widgets/abstract_card.dart';
import 'package:turkish/turkish.dart';

class CreditCardWidget extends AbstractCard {
  CreditCardWidget(CreditCard card, Function selectCard)
      : super(card, selectCard);

  void cardNumberClipboard(BuildContext context) {
    Scaffold.of(context).removeCurrentSnackBar();
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Card number copied to clipboard."),
    ));
    Clipboard.setData(ClipboardData(text: card.cardNumber));
  }

  void cardNameClipboard(BuildContext context) {
    Scaffold.of(context).removeCurrentSnackBar();
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Card holder name copied to clipboard."),
    ));
    Clipboard.setData(ClipboardData(text: card.name));
  }

  @override
  List<Widget> construct(context) {
    return [
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
          margin: EdgeInsets.all(4),
          padding: EdgeInsets.all(5),
          child: Text(
            card.title,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18,
            ),
          ),
        ),
      ),
      Flexible(
        fit: FlexFit.loose,
        flex: 12,
        child: FractionallySizedBox(
          widthFactor: 0.27,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black26,
              border: Border.all(
                color: Colors.black26,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            margin:
                EdgeInsets.only(left: MediaQuery.of(context).size.width / 10),
          ),
        ),
      ),
      Flexible(
        flex: 12,
        child: InkWell(
          onTap: () => cardNumberClipboard(context),
          onLongPress: () => cardNumberClipboard(context),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              card.getCardNumberSpaced(),
              style: TextStyle(
                fontFamily: 'Farrington-7B',
                letterSpacing: 4,
                wordSpacing: 10,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
      Flexible(
        flex: 12,
        child: Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  "VALID\nTHRU       ",
                  style: TextStyle(fontSize: 7),
                ),
              ),
              Text(
                card.date,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
      Flexible(
        flex: 12,
        child: Container(
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 10, bottom: 20),
          child: InkWell(
            onTap: () => cardNameClipboard(context),
            onLongPress: () => cardNameClipboard(context),
            child: Text(
              card.name,
              // card.name.toUpperCase(),
              // turkish.toUpperCase(card.name),
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Farrington-7B',
              ),
            ),
          ),
        ),
      ),
    ];
  }
}
