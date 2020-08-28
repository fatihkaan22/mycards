import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:mycards/models/credit_card.dart';

import 'editible_card.dart';
import 'editible_card_back.dart';

class NewCard extends StatefulWidget {
  final Function addCard;
  NewCard(this.addCard);
  @override
  _NewCardState createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  CreditCard card = CreditCard(
    color: Colors.blueGrey[300],
    background: Colors.blueGrey,
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

  void _openDialog(String title, Widget content) {
    AlertDialog dialog = AlertDialog(
      contentPadding: const EdgeInsets.all(6.0),
      title: Text(title),
      content: content,
      actions: [
        FlatButton(
          child: Text('CANCEL'),
          onPressed: Navigator.of(context).pop,
        ),
        FlatButton(
          child: Text('SUBMIT'),
          onPressed: () {
            Navigator.of(context).pop();
            // setState(() => _mainColor = _tempMainColor);
            // setState(() => _shadeColor = _tempShadeColor);
          },
        ),
      ],
    );

    Navigator.of(context).push(
      PageRouteBuilder(pageBuilder: (context, _, __) => dialog, opaque: false),
    );
  }

  void _chooseColor() async {
    _openDialog(
      "Color picker",
      MaterialColorPicker(
        // selectedColor: _shadeColor,
        shrinkWrap: true,
        onlyShadeSelection: false,
        onColorChange: (color) => setState(() {
          card.color = color;
        }),
        onMainColorChange: (color) => setState(() {
          card.color = color;
        }),
      ),
    );
  }

  void _chooseBackgroundColor() async {
    _openDialog(
      "Color picker",
      MaterialColorPicker(
        // selectedColor: _shadeColor,
        shrinkWrap: true,
        onlyShadeSelection: false,
        onColorChange: (color) => setState(() => card.background = color),
        onMainColorChange: (color) => setState(() => card.background = color),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < numberControllers.length; i++) {
      numberControllers[i] = TextEditingController();
    }

    GlobalKey<FlipCardState> cardKeyInput = GlobalKey<FlipCardState>();
    FocusNode focusCVC = FocusNode();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          child: FlipCard(
            key: cardKeyInput,
            direction: FlipDirection.HORIZONTAL,
            front: Container(
              child: EditibleCard(
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
        Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Divider(thickness: 1),
              ListTile(
                onTap: () => _chooseBackgroundColor(),
                title: Text("Background Color"),
                trailing: CircleAvatar(
                  backgroundColor: card.background,
                ),
              ),
              Divider(thickness: 1),
              ListTile(
                onTap: () => _chooseColor(),
                title: Text("Primary Color"),
                trailing: CircleAvatar(
                  backgroundColor: card.color,
                ),
              ),
              Divider(thickness: 1),
            ],
          ),
        ),
        OutlineButton(
          child: Text("Done"),
          onPressed: () {
            var number = StringBuffer();
            for (var i = 0; i < numberControllers.length; i++) {
              number.write(numberControllers[i].text);
            }

            widget.addCard(CreditCard(
              title: titleController.text,
              cardNumber: number.toString(),
              name: holderController.text,
              date: monthController.text + "/" + yearController.text,
              cvv: cvcController.text,
              color: card.color,
              background: card.background,
            ));
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
