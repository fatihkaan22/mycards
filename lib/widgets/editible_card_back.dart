import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mycards/models/credit_card.dart';
import 'abstract_card.dart';

class EditibleCardBack extends AbstractCard {
  GlobalKey<FlipCardState> cardKeyInput;
  TextEditingController cvcController;
  FocusNode focusCVC;

  EditibleCardBack.noFunction(
      CreditCard card, this.cardKeyInput, this.cvcController, this.focusCVC)
      : super(card, null);

  EditibleCardBack(CreditCard card, Function selectCard)
      : super(card, selectCard);

  @override
  List<Widget> construct(BuildContext context) {
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
    ];
  }
}
