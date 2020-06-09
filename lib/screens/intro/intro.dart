import 'package:adnproject/constants/strings.dart';
import 'package:flutter/material.dart';

class IntroRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              flex: 3,
              child: Container(),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                Strings.appTitle,
                style: TextStyle(fontSize: 30.0),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                Strings.healthDeclaration,
                style: TextStyle(fontSize: 40.0),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(),
            ),
            Container(
              width: 200.0,
              height: 50.0,
              child: RaisedButton(
                child: Text(
                  Strings.domesticGuests,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, RouteStrings.selectMethod);
                },
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
