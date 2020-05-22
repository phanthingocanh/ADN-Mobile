import 'package:validators/validators.dart' as validate;
import 'package:adnproject/constants/strings.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart' as validate;
import 'package:intl/intl.dart';
// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart' as datetime_picker_formfield;



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
            MyCustomForm(),
          ],
        ),
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
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Họ và tên'
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Vui lòng nhập tên';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
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
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
            child: TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Địa chỉ thường trú',
                alignLabelWithHint: true,
                hintText: 'Nhập địa chỉ thường trú',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)
                ),


              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Vui lòng nhập địa chỉ thường trú';
                }
                return null;
              },
            ),
          ),

          TravelCheckbox(),

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

class TravelCheckbox extends StatefulWidget {
  TravelCheckbox({Key key}) : super(key: key);

  @override
  _TravelCheckboxState createState() => _TravelCheckboxState();
}

class _TravelCheckboxState extends State<TravelCheckbox> {
  @override
  bool _travel = false;
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 0.0),
          child: CheckboxListTile(
              title: const Text('Di chuyển trong nước?'),
              value: _travel,
              onChanged: (bool value) {
                setState(() {
                  _travel = value;
                });
              }
          ),
        ),
        Visibility(
          visible: _travel,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: 'Nơi đi'
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Vui lòng nhập nơi đi';
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }
}
