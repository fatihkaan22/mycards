import 'package:flutter/material.dart';

class CreditCard {
  final String id;
  final String title;
  final String cardNumber;
  final String name;
  final String date;
  final String cvv;
  final Color color;
  final Color backgorund;

  CreditCard({
    this.id,
    this.title,
    this.cardNumber,
    this.name,
    this.date,
    this.cvv,
    this.color,
    this.backgorund,
  });

  String getCardNumberSpaced() {
    StringBuffer sb = StringBuffer();
    for (int i = 0; i <= 12; i += 4) {
      sb.write(cardNumber.substring(i, i + 4) + ' ');
    }
    print(sb.toString());
    return sb.toString();
  }
}
