import 'package:flutter/material.dart';

abstract class CardInfoEvent {}

class UpdateCardTypeEvent extends CardInfoEvent {
  final cardType;

  UpdateCardTypeEvent({@required this.cardType});
}

class UpdateFrontImageEvent extends CardInfoEvent {
  final frontImage;

  UpdateFrontImageEvent({@required this.frontImage});
}

class UpdateBackImageEvent extends CardInfoEvent {
  final backImage;

  UpdateBackImageEvent({@required this.backImage});
}

class SendCardInfoEvent extends CardInfoEvent {}
