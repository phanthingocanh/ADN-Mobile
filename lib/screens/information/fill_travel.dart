import 'package:adnproject/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
// import 'package:email_validator/email_validator.dart';
// import 'package:dropdownfield/dropdownfield.dart';

// import 'package:validators/validators.dart' as validate;

class FillTravelRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final appTitle = 'Form Validation Demo';
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.formTravelTitle),
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
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),


              ),
              validator: (value) {
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
                      Navigator.pushNamed(context, RouteStrings.fillFormSymptom);


                    } else {
                      //    If all data are not valid then start auto validation.
                      setState(() {
                        _autoValidate = true;
                      });
                    }
                  },
                  color: Colors.blue[400],
                  child: Text('Tiếp tục',  style: TextStyle(fontSize: 20, color: Colors.white),),
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

  var currentSelectedValue='Tp. Hồ Chí Minh';
  var provinceTypes = ["Tp. Hồ Chí Minh", "Hà Nội", "Lâm Đồng"];
  final format = DateFormat("yyyy-MM-dd");
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(5.0, 10.0, 20.0, 0.0),
          child: CheckboxListTile(
              title: Text('Di chuyển trong nước?',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              value: _travel,
              onChanged: (bool value) {
                setState(() {
                  _travel = value;
                });
              }
          ),
        ),

        Column(
          children: <Widget>[
            Visibility(
              visible: _travel,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                          labelText: 'Nơi đi',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          hint: Text("Chọn tỉnh"),
                          value: currentSelectedValue,
                          isDense: true,
                          onChanged: (newValue) {
                            setState(() {
                              currentSelectedValue = newValue;
                            });
                            print(currentSelectedValue);
                          },
                          items: provinceTypes.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            Visibility(
              visible: _travel,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                          labelText: 'Nơi đến',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          hint: Text('Chọn Tỉnh'),
                          value: currentSelectedValue,
                          isDense: true,
                          onChanged: (newValue) {
                            setState(() {
                              currentSelectedValue = newValue;
                            });
                            print(currentSelectedValue);
                          },
                          items: provinceTypes.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Visibility(
              visible: _travel,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: DateTimeField(
                  decoration: InputDecoration(
                    labelText: 'Ngày đi',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    ),

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
              ),
            ),
            Visibility(
              visible: _travel,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: DateTimeField(
                  decoration: InputDecoration(
                    labelText: 'Ngày đến',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    ),

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
              ),
            ),
            Visibility(
              visible: _travel,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Phương tiện di chuyển',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    ),

                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Vui lòng nhập phương tiện di chuyển';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
        ],
    );
  }
}






