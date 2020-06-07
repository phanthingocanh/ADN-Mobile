import 'package:adnproject/models/card_info.dart';
import 'package:flutter/material.dart';

class CardInfoState {
  final CardInfo cardInfo;
  final bool isSending;

  CardInfoState({@required this.cardInfo, this.isSending = false});

  copyWith({cardType, frontImage, backImage, isSending = false}) {
    this.cardInfo.cardType = cardType ?? this.cardInfo.cardType;
    this.cardInfo.frontImage = frontImage ?? this.cardInfo.frontImage;
    this.cardInfo.backImage = backImage ?? this.cardInfo.backImage;
    return CardInfoState(cardInfo: this.cardInfo, isSending: isSending);
  }
}
