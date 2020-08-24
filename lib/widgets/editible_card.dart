import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mycards/models/credit_card.dart';
import 'package:mycards/widgets/abstract_card.dart';
import 'package:mycards/widgets/card_number_part.dart';

class EditibleCard extends AbstractCard {
  EditibleCard(CreditCard card, Function selectCard) : super(card, selectCard);

  TextEditingController titleController;
  List<TextEditingController> numberControllers;
  TextEditingController holderController;
  TextEditingController monthController;
  TextEditingController yearController;
  GlobalKey<FlipCardState> cardKeyInput;
  FocusNode focusCVC;

  EditibleCard.noSelection(
      CreditCard card,
      TextEditingController titleController,
      List<TextEditingController> numberControllers,
      TextEditingController monthController,
      TextEditingController yearController,
      TextEditingController holderController,
      GlobalKey<FlipCardState> cardKeyInput,
      FocusNode focusCVC)
      : super(card, () {}) {
    this.titleController = titleController;
    this.numberControllers = numberControllers;
    this.monthController = monthController;
    this.yearController = yearController;
    this.holderController = holderController;
    this.cardKeyInput = cardKeyInput;
    this.focusCVC = focusCVC;
  }

  @override
  List<Widget> construct(context) {
    FocusNode focusNumber0 = FocusNode();
    FocusNode focusNumber1 = FocusNode();
    FocusNode focusNumber2 = FocusNode();
    FocusNode focusNumber3 = FocusNode();
    FocusNode focusMonth = FocusNode();

    return [
      Flexible(
        flex: 14,
        child: Container(
          margin: EdgeInsets.all(4),
          child: IntrinsicWidth(
            child: TextFormField(
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).nextFocus();
              },
              controller: titleController,
              textAlignVertical: TextAlignVertical.center,
              maxLines: 1,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: "Card Title",
                filled: true,
                fillColor: card.color,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: card.color, width: 3),
                  borderRadius: BorderRadius.circular(18),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: card.color, width: 3),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
              ),
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
        child: Container(
          alignment: Alignment.center,
          child: Row(children: [
            CardNumberPart(numberControllers[0], focusNumber0, focusNumber1),
            CardNumberPart(numberControllers[1], focusNumber1, focusNumber2),
            CardNumberPart(numberControllers[2], focusNumber2, focusNumber3),
            CardNumberPart(numberControllers[3], focusNumber3, focusMonth),
          ]),
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
              Flexible(
                child: IntrinsicWidth(
                  child: TextFormField(
                    inputFormatters: [
                      WhitelistingTextInputFormatter(RegExp(r"[0-9]")),
                      LengthLimitingTextInputFormatter(2),
                    ],
                    focusNode: focusMonth,
                    onChanged: (newVal) {
                      if (newVal.length == 2) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    keyboardType: TextInputType.number,
                    controller: monthController,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).nextFocus();
                    },
                    decoration: InputDecoration(
                      hintText: "00",
                    ),
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Text("/"),
              Flexible(
                child: IntrinsicWidth(
                  child: TextFormField(
                    inputFormatters: [
                      WhitelistingTextInputFormatter(RegExp(r"[0-9]")),
                      LengthLimitingTextInputFormatter(2),
                    ],
                    onChanged: (newVal) {
                      if (newVal.length == 2) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    controller: yearController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).nextFocus();
                    },
                    decoration: InputDecoration(
                      hintText: "00",
                    ),
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
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
              left: MediaQuery.of(context).size.width / 10, bottom: 5),
          child: FractionallySizedBox(
            widthFactor: 0.8,
            child: TextFormField(
              controller: holderController,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                cardKeyInput.currentState.toggleCard();
                FocusScope.of(context).requestFocus(focusCVC);
              },
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                hintText: 'Card Holder',
                // border: InputBorder.none,
              ),
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
