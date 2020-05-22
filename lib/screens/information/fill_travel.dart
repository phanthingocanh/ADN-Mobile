import 'package:adnproject/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

// import 'package:validators/validators.dart' as validate;

class FillTravelRoute extends StatelessWidget {
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
          MyTravelForm(),
        ],
      ),
    );
  }
}

// Create a Form widget.
class MyTravelForm extends StatefulWidget {
  @override
  MyTravelFormState createState() {
    return MyTravelFormState();
  }
}

class MyTravelFormState extends State<MyTravelForm> {
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
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: Text('Trong vòng 14 ngày qua, anh/chị có đi đến quốc gia/vùng lãnh thổ nào?',
              style: TextStyle(
                fontSize: 17
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: TextFormField(
              maxLines: 4,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                hintText: 'Nhập tên các quốc gia/vùng lãnh thổ đã đi qua (nếu có)',
//                border: OutlineInputBorder(
//                    borderRadius: BorderRadius.circular(10.0)
//                ),


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
                    } else {
                      //    If all data are not valid then start auto validation.
                      setState(() {
                        _autoValidate = true;
                      });
                    }
                  },
                  color: Colors.blue[400],
                  child: Text('Tiếp tục'),
                ),
              ),
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