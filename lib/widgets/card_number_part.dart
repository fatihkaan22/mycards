import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'editible_card.dart';

class CardNumberPart extends StatelessWidget {
  final TextEditingController _controller;
  final FocusNode currentFocusNode;
  final FocusNode nextFocus;

  CardNumberPart(this._controller, this.currentFocusNode, this.nextFocus);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        textInputAction: TextInputAction.next,
        focusNode: currentFocusNode,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(nextFocus);
        },
        onChanged: (newVal) {
          if (newVal.length == 4) {
            FocusScope.of(context).requestFocus(nextFocus);
          }
        },
        inputFormatters: [
          WhitelistingTextInputFormatter(RegExp(r"[0-9]")),
          LengthLimitingTextInputFormatter(4),
        ],
        keyboardType:
            TextInputType.numberWithOptions(signed: false, decimal: true),
        controller: _controller,
        decoration: InputDecoration(contentPadding: EdgeInsets.all(10)),
        // card.getCardNumberSpaced(),
        style: TextStyle(
          fontFamily: 'Farrington-7B',
          letterSpacing: 4,
          wordSpacing: 10,
          fontSize: 16,
        ),
      ),
    );
  }
}
