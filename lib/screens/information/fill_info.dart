import 'package:adnproject/constants/strings.dart';
// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart' as validate;

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

// import 'package:intl/intl.dart' as intl;
// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart' as datetime_picker_formfield;


class FillInforRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final appTitle = 'Form Validation Demo';

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
  // final format = intl.DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 100.0),
            child: RaisedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

