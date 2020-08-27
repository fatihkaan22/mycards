import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mycards/models/credit_card.dart';
import 'abstract_card.dart';

class EditibleCardBack extends StatelessWidget {
  GlobalKey<FlipCardState> cardKeyInput;
  TextEditingController cvcController;
  FocusNode focusCVC;
  final CreditCard card;

  EditibleCardBack.noFunction(
      this.card, this.cardKeyInput, this.cvcController, this.focusCVC);

  EditibleCardBack(this.card, Function selectCard);

  @override
  Widget build(BuildContext context) {
    return AbstractCard(
      card: card,
      children: [
        Flexible(
          flex: 12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
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
                  "                     ",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Icon(
                  Icons.loop,
                ),
              ),
            ],
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
            child: Container(
              alignment: Alignment.center,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(),
                    IntrinsicWidth(
                      child: TextFormField(
                        focusNode: focusCVC,
                        inputFormatters: [
                          WhitelistingTextInputFormatter(RegExp(r"[0-9]")),
                          LengthLimitingTextInputFormatter(3),
                        ],
                        decoration: InputDecoration(hintText: "CVC"),
                        controller: cvcController,
                        keyboardType: TextInputType.number,
                        onFieldSubmitted: (_) {
                          cardKeyInput.currentState.toggleCard();
                        },
                        style: TextStyle(
                          color: card.textColor,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
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
