import 'package:adnproject/constants/strings.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:validators/validators.dart' as validate;
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
          title: Text(Strings.formCMNDTitle),
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
  bool _autoValidate = false;

  final format = DateFormat("yyyy-MM-dd");
  var now = new DateTime.now();
  // var formatter = new DateFormat("MM");
  // String month = formatter.format(now);

  var currentSelectedProvince = 'Tp. Hồ Chí Minh';
  var currentSelectedGender = 'Nam';
  String _fullName;
  String  _cmnd;
  DateTime _birthday;
  String _address;
  DateTime _ngaycap;

  var provinceTypes = ["Tp. Hồ Chí Minh", "Hà Nội", "Lâm Đồng"];
  var gender = ["Nam","Nữ","Khác"];



  @override
  Widget build(BuildContext context) {

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
              decoration: InputDecoration(
                labelText: 'Họ và tên',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),

              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Vui lòng nhập họ tên';
                }
                return null;
              },
              onSaved: (String val) {
                _fullName = val;
              }
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Số CMND',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),

              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Vui lòng nhập số chứng minh nhân dân';
                }
                if (validate.isNumeric(value) == false) {
                  return 'Vui lòng nhập số chứng minh nhân dân hợp lệ';
                }
                return null;
              },
              onSaved: (String val) {
                _cmnd = val;
              }
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: FormField<String>(
              builder: (FormFieldState<String> state) {
                return InputDecorator(
                  decoration: InputDecoration(
                      labelText: 'Giới tính',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: Text("Chọn giới tính"),
                      value: currentSelectedGender,
                      isDense: true,
                      onChanged: (newValue) {
                        setState(() {
                          currentSelectedGender = newValue;
                        });
                        // print(currentSelectedGender);
                      },
                      items: gender.map((String value) {
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
          //
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: DateTimeField(
              decoration: InputDecoration(
                labelText: 'Ngày sinh',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              format: format,
              validator: (value) {
                if (value == null) {
                  return 'Vui lòng nhập ngày sinh';
                }
                return null;
              },
              onSaved: (DateTime val) {
                _birthday = val;
              },
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime(1995, now.month, now.day),
                    lastDate: DateTime(2100));
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
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
              onSaved: (String val) {
                _address = val;
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: DateTimeField(
              decoration: InputDecoration(
                labelText: 'Ngày cấp CMND',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),

              ),
              format: format,
              validator: (value) {
                if (value == null) {
                  return 'Vui lòng nhập ngày cấp CMND';
                }
                return null;
              },
              onSaved: (DateTime val) {
                _ngaycap = val;
              },
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime(2015, now.month, now.day),
                    lastDate: DateTime(2100));
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: FormField<String>(
              builder: (FormFieldState<String> state) {
                return InputDecorator(
                  decoration: InputDecoration(
                      labelText: 'Nơi cấp CMND',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: Text("Chọn tỉnh"),
                      value: currentSelectedProvince,
                      isDense: true,
                      onChanged: (newValue) {
                        setState(() {
                          currentSelectedProvince = newValue;
                        });
                        print(currentSelectedProvince);
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
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: Text(
              'Khai báo thông tin sai là vi phạm pháp luật Việt Nam và có thể xử lý hình sự.',
              style: TextStyle(
                fontSize: 17,
                color: Colors.red,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
            child: Text(
              'Vui lòng kiểm tra lại thông tin trước khi sang bước tiếp theo.',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: SizedBox(
              width: double.infinity,
              child: ButtonTheme(
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false
                    // otherwise.
                    if (_formKey.currentState.validate()) {
                      Navigator.pushNamed(context, RouteStrings.fillFormEmailPhone);

                    }else {
                      //    If all data are not valid then start auto validation.
                      setState(() {
                        _autoValidate = true;
                      });
                    }
                  },
                  color: Colors.blue[400],
                  child: Text('Tiếp tục',
                    style: TextStyle(fontSize: 20, color: Colors.white),),
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
