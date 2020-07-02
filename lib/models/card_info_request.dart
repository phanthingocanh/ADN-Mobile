import 'dart:io';

import 'package:adnproject/constants/enums.dart';

class CardInfoRequest {
  final CardType cardType;
  final String frontImageBase64;
  final String backImageBase64;

  CardInfoRequest({
    this.cardType = CardType.cmnd,
    this.frontImageBase64,
    this.backImageBase64,
  });

  Map<String, dynamic> toJson() => {
    'cardType': cardType.toString().split('.').last.toUpperCase(),
    'frontImageBase64': frontImageBase64,
    'backImageBase64': backImageBase64,
  };

}
