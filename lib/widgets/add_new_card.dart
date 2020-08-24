import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:mycards/models/credit_card.dart';
import 'package:mycards/widgets/credit_card_back_widget.dart';

import 'editible_card.dart';
import 'editible_card_back.dart';

class NewCard extends StatelessWidget {
  final CreditCard card = CreditCard(
    color: Colors.blue,
    backgorund: Colors.orange[700],
  );

  final titleController = TextEditingController();
  final List<TextEditingController> numberControllers =
      List<TextEditingController>(4);
  final monthController = TextEditingController();
  final yearController = TextEditingController();
  final holderController = TextEditingController();
  final cvcController = TextEditingController();

  void _printLastValue() {
    print("${titleController.text}");
    print("${numberControllers[0].text}");
    print("${numberControllers[1].text}");
    print("${numberControllers[2].text}");
    print("${numberControllers[3].text}");
    print("${monthController.text}");
    print("${yearController.text}");
    print("${holderController.text}");
    print("${cvcController.text}");
  }

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < numberControllers.length; i++) {
      numberControllers[i] = TextEditingController();
    }

    GlobalKey<FlipCardState> cardKeyInput = GlobalKey<FlipCardState>();
    FocusNode focusCVC = FocusNode();

    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: FlipCard(
              key: cardKeyInput,
              direction: FlipDirection.HORIZONTAL,
              front: Container(
                child: EditibleCard.noSelection(
                  card,
                  titleController,
                  numberControllers,
                  monthController,
                  yearController,
                  holderController,
                  cardKeyInput,
                  focusCVC,
                ),
              ),
              back: EditibleCardBack.noFunction(
                  card, cardKeyInput, cvcController, focusCVC),
            ),
          ),
          Text("select color"),
          RaisedButton(
            onPressed: () => _printLastValue(),
            child: Text("Done"),
          )
        ],
      ),
    );
  }
}
