import 'package:adnproject/constants/strings.dart';
import 'package:flutter/material.dart';

class DomesticGuestBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          Strings.healthDeclaration,
          style: TextStyle(fontSize: 35.0),
        ),
        SizedBox(height: 10.0),
        Text(
          Strings.domesticGuests,
          style: TextStyle(fontSize: 20.0),
        ),
      ],
    );
  }
}
