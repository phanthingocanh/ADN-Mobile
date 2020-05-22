import 'package:adnproject/constants/strings.dart';
import 'package:flutter/material.dart';

class IntroRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text(
            Strings.domesticGuests,
          ),

          onPressed: () {
            Navigator.pushNamed(context, RouteStrings.fillForm);
          },
        ),
      ),
    );
  }
}
