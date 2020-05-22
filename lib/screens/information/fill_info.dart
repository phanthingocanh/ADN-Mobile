import 'package:adnproject/constants/strings.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart' as validate;
import 'package:intl/intl.dart';
// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart' as datetime_picker_formfield;

class SelectImageRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.selectIdCardImage),
      ),
      body: Center(
        child: Text('This is temporary empty - hello'),
      ),
    );
  }
}

class FillInforRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final appTitle = 'Form Validation Demo';
      Color hexToColor(String code) {
            return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
          }
    return Scaffold(
        appBar: AppBar(
          title: Text(Strings.formTitle),
        ),
        body: MyCustomForm(),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.all(10.0)),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Họ và tên'
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),

          TextFormField(
            decoration: InputDecoration(
              labelText: 'Số CMND'
            ),
            validator: (value) {
              if (validate.isNumeric(value) == false | value.isEmpty) {
                return 'Vui lòng nhập số chứng minh nhân dân';
              }
              return null;
            },
          ),
          // 
          SizedBox(height: 16.0),
          DateTimeField(
            decoration: InputDecoration(
              labelText: 'Ngày sinh'
            ),
            format: format,
            onShowPicker: (context, currentValue) {
              return showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime(2100));
            },
          ),
          SizedBox(height: 16.0),
          DateTimeField(
            decoration: InputDecoration(
              labelText: 'Ngày cấp'
            ),
            format: format,
            onShowPicker: (context, currentValue) {
              return showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime(2100));
            },
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.all(16.0),
            // padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 100.0),
            child: RaisedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  // Scaffold.of(context)
                  //     .showSnackBar(SnackBar(content: Text('Processing Data')));
                  Navigator.pushNamed(context, RouteStrings.fillFormEmailPhone);
                  
                }
              },
              child: Text('Tiếp tục'),
            ),
          ),
        ],
      ),
    );
  }
}

