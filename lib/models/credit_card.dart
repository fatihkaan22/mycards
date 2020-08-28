import 'package:flutter/material.dart';

class CreditCard {
  final String id;
  final String title;
  final String cardNumber;
  final String name;
  final String date;
  final String cvv;
  Color color;
  Color background;
  Color textColor;
  Color titleColor;

  final List<String> numberInputs = List<String>(4);

  CreditCard({
    this.id,
    this.title,
    this.cardNumber,
    this.name,
    this.date,
    this.cvv,
    this.color,
    this.background,
  }) {
    textColor =
        background.computeLuminance() > 0.5 ? Colors.black87 : Colors.white70;
    titleColor =
        color.computeLuminance() > 0.5 ? Colors.black87 : Colors.white70;
  }

  recalculateColors() {
    textColor =
        background.computeLuminance() > 0.5 ? Colors.black87 : Colors.white70;
    titleColor =
        color.computeLuminance() > 0.5 ? Colors.black87 : Colors.white70;
  }

  void updateNumber(int pos, String text) {
    numberInputs[pos] = text;
  }

  String getCardNumberSpaced() {
    if (cardNumber.length != 12) return "";
    StringBuffer sb = StringBuffer();
    for (int i = 0; i <= 12; i += 4) {
      sb.write(cardNumber.substring(i, i + 4) + ' ');
    }
    print(sb.toString());
    return sb.toString();
  }
}
