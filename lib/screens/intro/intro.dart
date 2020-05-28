import 'package:adnproject/constants/strings.dart';
import 'package:adnproject/screens/pop_up/success.dart';
import 'package:flutter/material.dart';

class IntroRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopupDialog(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(
                Strings.domesticGuests,
              ),
              onPressed: () {
                Navigator.pushNamed(context, RouteStrings.showPopup);
              },
            )
          ],
        ),
      ),
    );
  }
}
