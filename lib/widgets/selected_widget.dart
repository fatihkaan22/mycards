import 'package:flutter/material.dart';
import 'package:mycards/models/credit_card.dart';

import 'credit_card_back_widget.dart';
import 'credit_card_widget.dart';

class SelectedCardWidget extends StatefulWidget {
  final CreditCard _selectedCard;
  final Function _selectCard;
  final Function _turnCard;
  final bool frontFace;

  SelectedCardWidget(this._selectedCard, this._selectCard, this._turnCard, this.frontFace);

  @override
  _SelectedCardWidgetState createState() => _SelectedCardWidgetState();
}

class _SelectedCardWidgetState extends State<SelectedCardWidget> {

  @override
  Widget build(BuildContext context) {
    Widget _child;
    if (widget.frontFace) {
      _child = CreditCardWidget(widget._selectedCard, widget._selectCard);
    } else {
      _child = CreditCardBackWidget(widget._selectedCard);
    }

    return GestureDetector(
      onHorizontalDragStart: (drag) => widget._turnCard(),
      child: Container(
        child: _child,
      ),
    );
  }
}
