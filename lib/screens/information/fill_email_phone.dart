import 'package:adnproject/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
// import 'package:validators/validators.dart' as validate;

class FillEmailPhoneRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final appTitle = 'Form Validation Demo';
    return Scaffold(
        appBar: AppBar(
          title: Text(Strings.formInfoTitle),
        ),
        body: ListView(
//        crossAxisAlignment: CrossAxisAlignment.center,
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(
                child: Container(
                    padding: EdgeInsets.only(top:20),
                    child: Text(
                        'KHAI BÁO Y TẾ',
                        style: TextStyle(
                            fontSize: 40.0
                        )
                    ),
                  ),
              ),

              Center(
                child: Container(
                  padding: EdgeInsets.only(top:10),
                  child: Text(
                      'Cho khách nội địa',
                      style: TextStyle(
                      fontSize: 25.0
                    )
                    ),
                  ),
                ),
              Divider(
                height: 30.0,
                color: Colors.grey[800],
              ),
              MyCustomFormEmailPhone(),
            ],
        ),
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
  var _email ;
  var _mobile;

  

  @override
  Widget build(BuildContext context) {
    var controller = new MaskedTextController(mask: '0000-000-000');
    controller.beforeChange = (String previous, String next) {
      print("$previous");
      if (previous.length == 12 ) {
        controller.updateMask('0000-000-000');
      }
      else{
        controller.updateMask('0000-000-000');
      }

      return true;
    };
    controller.afterChange = (String previous, String next) {
//    print("$previous | $next");
    };
    controller.updateText(_mobile);
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      autovalidate: _autoValidate,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          child: TextFormField(
            controller: controller,
            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              labelText: 'Số điện thoại',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              String patttern =r'(^(?:[+0]9)?[0-9]{4}[\s-]?[0-9]{3}[\s-]?[0-9]{3}$)';
              RegExp regExp = new RegExp(patttern);
              _mobile = value;
              if (value.isEmpty) {

                return 'Vui lòng nhập số điện thoại';
              }
              else if (!regExp.hasMatch(value)) {
                return 'Số điện thoại không hợp lệ';
              }
              return null;

            },
            onSaved: (String val) {
              _mobile = val;
            },
          ),
        ),

        new Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          child: new TextFormField(
            decoration: InputDecoration(
              labelText: 'Địa chỉ email',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),

            ),
            keyboardType: TextInputType.emailAddress,
            validator: validateEmail,
            onSaved: (String val) {
              _email = val;
            },
          ),
        ),
        new SizedBox(
          height: 10.0,
        ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: SizedBox(
              width: double.infinity,
              child: ButtonTheme(
                height: 50,
                child: RaisedButton(
                  onPressed: (){
                    if (_formKey.currentState.validate()) {
                      //    If all data are correct then save data to out variables
                          _formKey.currentState.save();
                          Navigator.pushNamed(context, RouteStrings.fillFormTravel);
                        } else {
                      //    If all data are not valid then start auto validation.
                          setState(() {
                            _autoValidate = true;
                          });
                        }
                  },
                  color: Colors.blue[400],
                  child: Text(
                    'Tiếp tục',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),

      ],
                ),
    );
  }
}





Widget _phoneInput() {
  var controller = new MaskedTextController(mask: '0000-000-000');
  var _mobile;

  controller.beforeChange = (String previous, String next) {
    print("$previous");
    if (previous.length == 12 ) {

      controller.updateMask('0000-000-000');
    }
    else{
      controller.updateMask('0000-000-000');

    }

    return true;
  };
  controller.afterChange = (String previous, String next) {
//    print("$previous | $next");
  };

  return new TextFormField(
    controller: controller,
    inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
    decoration: InputDecoration(
      labelText: 'Số điện thoại',
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
      ),
    ),

    keyboardType: TextInputType.number,
    validator: (value) {
      if (value.isEmpty) {
        return 'Vui lòng nhập số điện thoại';
      }
      return null;
    },
    onSaved: (String val) {
      _mobile = val;
    },
  );
}




String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (value.isEmpty){
    return 'Vui lòng nhập địa chỉ email';
  }
  if (!regex.hasMatch(value))
    return 'Địa chỉ email không hợp lệ';
  else
    return null;
}
String validateMobile(String value) {
  String patttern =r'(^(?:[+0]9)?[0-9]{4}[\s-]?[0-9]{3}[\s-]?[0-9]{3}$)';
  RegExp regExp = new RegExp(patttern);

  if (value.isEmpty) {

        return 'Vui lòng nhập số điện thoại';
  }
  else if (!regExp.hasMatch(value)) {
        return 'Số điện thoại không hợp lệ';
  }
  return null;
} 
