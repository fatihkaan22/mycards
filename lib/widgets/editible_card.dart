import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mycards/models/credit_card.dart';
import 'package:mycards/widgets/abstract_card.dart';
import 'package:mycards/widgets/card_number_part.dart';

class EditibleCard extends StatelessWidget {
  final CreditCard card;
  final TextEditingController titleController;
  final List<TextEditingController> numberControllers;
  final TextEditingController holderController;
  final TextEditingController monthController;
  final TextEditingController yearController;
  final GlobalKey<FlipCardState> cardKeyInput;
  final FocusNode focusCVC;

  EditibleCard(
      this.card,
      this.titleController,
      this.numberControllers,
      this.monthController,
      this.yearController,
      this.holderController,
      this.cardKeyInput,
      this.focusCVC);

  @override
  Widget build(context) {
    FocusNode focusNumber0 = FocusNode();
    FocusNode focusNumber1 = FocusNode();
    FocusNode focusNumber2 = FocusNode();
    FocusNode focusNumber3 = FocusNode();
    FocusNode focusMonth = FocusNode();

    for (var i = 0; i < card.numberInputs.length; i++) {
      if (card.numberInputs[i] != null) {
        numberControllers[i].text = card.numberInputs[i];
      }
    }

    card.recalculateColors();

    return AbstractCard(
      card: card,
      children: [
        Flexible(
          flex: 14,
          child: Container(
            margin: EdgeInsets.all(4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IntrinsicWidth(
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
                      color: card.titleColor,
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
              CardNumberPart(numberControllers[0], focusNumber0, focusNumber1,
                  card.textColor, card, 0),
              CardNumberPart(numberControllers[1], focusNumber1, focusNumber2,
                  card.textColor, card, 1),
              CardNumberPart(numberControllers[2], focusNumber2, focusNumber3,
                  card.textColor, card, 2),
              CardNumberPart(numberControllers[3], focusNumber3, focusMonth,
                  card.textColor, card, 3),
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
                    style: TextStyle(
                      color: card.textColor,
                      fontSize: 7,
                    ),
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
                        color: card.textColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Text("/",
                    style: TextStyle(
                      color: card.textColor,
                    )),
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
                        color: card.textColor,
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
                  color: card.textColor,
                  fontSize: 16,
                  fontFamily: 'Farrington-7B',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
