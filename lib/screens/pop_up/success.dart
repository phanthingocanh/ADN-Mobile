import 'package:adnproject/constants/strings.dart';
import 'package:adnproject/screens/information/fill_travel.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';



class PopupDialog extends StatelessWidget {
  bool _failed = false;
  @override

  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Visibility(
                visible: _failed,
                child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: RaisedButton(
                  child: Text('Basic Alert'),
                  onPressed: () => _onBasicAlertPressed(context),
                ),
              ),  
            ),
            Visibility(
                visible: _failed,
                child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: RaisedButton(
                  child: Text('Alert with Button'),
                  onPressed: () => _onAlertButtonPressed(context),
                ),
              ),  
            ),
                        
            // RaisedButton(
            //   child: Text('Alert with Style'),
            //   onPressed: () => _onAlertWithStylePressed(context),
            // ),
            Visibility(
                visible: !_failed,
                child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: RaisedButton(
                  child: Text('Tiếp tục'),
                  onPressed: () { 
                    Navigator.pushNamed(context, RouteStrings.fillForm);
                    _onAlertWithCustomImagePressed(context);
                  },
                ),
              ),  
            ),
            
            // RaisedButton(
            //   child: Text('Alert with Custom Content'),
            //   onPressed: () => _onAlertWithCustomContentPressed(context),
            // ),
          ],
        ),
      ),
    );
  }

// The easiest way for creating RFlutter Alert
  _onBasicAlertPressed(context) {
    Alert(
            context: context,
            title: "RFLUTTER ALERT",
            desc: "Flutter is more awesome with RFlutter Alert.")
        .show();
  }

// Alert with single button.
  _onAlertButtonPressed(context) {
    Alert(
      context: context,
      type: AlertType.error,
      title: "RFLUTTER ALERT",
      desc: "Flutter is more awesome with RFlutter Alert.",
      buttons: [
        DialogButton(
          child: Text(
            "COOL",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }

// Alert with multiple and custom buttons
  _onAlertButtonsPressed(context) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "RFLUTTER ALERT",
      desc: "Flutter is more awesome with RFlutter Alert.",
      buttons: [
        DialogButton(
          child: Text(
            "FLAT",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Text(
            "GRADIENT",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
        )
      ],
    ).show();
  }

// Advanced using of alerts
  _onAlertWithStylePressed(context) {
    // Reusable alert style
    var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(fontWeight: FontWeight.bold),
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(
        color: Colors.red,
      ),
      constraints: BoxConstraints.expand(width: 300)
    );

    // Alert dialog using custom alert style
    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.info,
      title: "RFLUTTER ALERT",
      desc: "Flutter is more awesome with RFlutter Alert.",
      buttons: [
        DialogButton(
          child: Text(
            "COOL",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color.fromRGBO(0, 179, 134, 1.0),
          radius: BorderRadius.circular(0.0),
        ),
      ],
    ).show();
  }

// Alert custom images
  _onAlertWithCustomImagePressed(context) {
    Alert(
      context: context,
      title: "Trích xuất thông tin thành công",
      // desc: "Trích xuất thông tin thành công",
      image: Image.asset("assets/images/icon_success.png"),
      buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Đóng",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]
    ).show();
  }
  
// Alert custom content
  _onAlertWithCustomContentPressed(context) {
    Alert(
        context: context,
        title: "LOGIN",
        content: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.account_circle),
                labelText: 'Username',
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: 'Password',
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "LOGIN",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }
}