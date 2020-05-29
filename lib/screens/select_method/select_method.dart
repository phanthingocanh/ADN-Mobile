import 'package:adnproject/constants/strings.dart';
import 'package:adnproject/models/card_info.dart';
import 'package:adnproject/screens/select_image/select_front_image.dart';
import 'package:adnproject/widgets/domestic_guest_banner.dart';
import 'package:flutter/material.dart';

class SelectMethodRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.selectMethod),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 3,
              child: Container(),
            ),
            Container(
              child: DomesticGuestBanner(),
            ),
            Flexible(
              flex: 2,
              child: Container(),
            ),
            Container(
              margin: EdgeInsets.all(5.0),
              width: 200.0,
              height: 50.0,
              child: RaisedButton(
                textTheme: ButtonTextTheme.primary,
                child: Text(
                  Strings.selectMethodAutomatic,
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelectFrontImageScreen(
                      cardInfo: new CardInfo(),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5.0),
              width: 200.0,
              height: 50.0,
              child: FlatButton(
                child: Text(
                  Strings.selectMethodManual,
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RouteStrings.fillForm,
                  );
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
