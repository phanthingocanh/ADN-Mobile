import 'package:adnproject/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

// import 'package:validators/validators.dart' as validate;

class FillEmailPhoneRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final appTitle = 'Form Validation Demo';
    return Scaffold(
        appBar: AppBar(
          title: Text(Strings.formTitle),
        ),
        body: MyCustomFormEmailPhone(),
    );
  }
}

// Create a Form widget.
class MyCustomFormEmailPhone extends StatefulWidget {
  @override
  MyCustomFormEmailPhoneState createState() {
    return MyCustomFormEmailPhoneState();
  }
} 
String validateMobile(String value) {
  String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = new RegExp(patttern);
  if (value.length == 0) {
        return 'Vui lòng nhập số điện thoại';
  }
  else if (!regExp.hasMatch(value)) {
        return 'Vui lòng nhập số điện thoại hợp lệ';
  }
  return null;
}   
// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormEmailPhoneState extends State<MyCustomFormEmailPhone> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormEmailPhoneState>.
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _email;
  String _mobile;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Số điện thoại'),
          keyboardType: TextInputType.phone,
          validator: validateMobile,
          onSaved: (String val) {
            _mobile = val;
          },
        ),
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Địa chỉ email'),
          keyboardType: TextInputType.emailAddress,
          validator: validateEmail,
          onSaved: (String val) {
            _email = val;
          },
        ),
        new SizedBox(
          height: 10.0,
        ),
        new RaisedButton(
          onPressed: (){
            if (_formKey.currentState.validate()) {
              //    If all data are correct then save data to out variables
                  _formKey.currentState.save();
                } else {
              //    If all data are not valid then start auto validation.
                  setState(() {
                    _autoValidate = true;
                  });
                }
          },
          child: new Text('Tiếp tục'),
        )
      ],
                ),
    );
  }
}



  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Vui lòng nhập địa chỉ email hợp lệ';
    else
      return null;
  }