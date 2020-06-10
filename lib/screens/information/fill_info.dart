import 'package:adnproject/constants/strings.dart';
import 'package:adnproject/models/person_info.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
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
        title: Text(Strings.formCMNDTitle),
      ),
      body: ListView(
//        crossAxisAlignment: CrossAxisAlignment.center,
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 20),
              child: Text('KHAI BÁO Y TẾ', style: TextStyle(fontSize: 40.0)),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 10),
              child:
                  Text('Cho khách nội địa', style: TextStyle(fontSize: 25.0)),
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

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue,
      TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text?.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  String _fullName;
  String _cmnd;
  DateTime _birthday;
  String _address;
  DateTime _ngaycap;

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

  var currentSelectedProvince = 'Hồ Chí Minh';
  var currentSelectedGender = 'Nam';


  // var currentSelectedValue = 'Hồ Chí Minh';
  var provinceTypes = ['An Giang', 'Bà Rịa-Vũng Tàu', 'Bạc Liêu', 'Bắc Kạn', 'Bắc Giang', 'Bắc Ninh', 'Bến Tre', 'Bình Dương', 'Bình Định', 'Bình Phước', 'Bình Thuận', 'Cà Mau', 'Cao Bằng', 'Cần Thơ', 'Đà Nẵng', 'Đắk Lắk', 'Đắk Nông', 'Điện Biên', 'Đồng Nai', 'Đồng Tháp', 'Gia Lai', 'Hà Giang', 'Hà Nam', 'Hà Nội', 'Hà Tây', 'Hà Tĩnh', 'Hải Dương', 'Hải Phòng', 'Hòa Bình', 'Hồ Chí Minh', 'Hậu Giang', 'Hưng Yên', 'Khánh Hòa', 'Kiên Giang', 'Kon Tum', 'Lai Châu', 'Lào Cai', 'Lạng Sơn', 'Lâm Đồng', 'Long An', 'Nam Định', 'Nghệ An', 'Ninh Bình', 'Ninh Thuận', 'Phú Thọ', 'Phú Yên', 'Quảng Bình', 'Quảng Nam', 'Quảng Ngãi', 'Quảng Ninh', 'Quảng Trị', 'Sóc Trăng', 'Sơn La', 'Tây Ninh', 'Thái Bình', 'Thái Nguyên', 'Thanh Hóa', 'Thừa Thiên - Huế', 'Tiền Giang', 'Trà Vinh', 'Tuyên Quang', 'Vĩnh Long', 'Vĩnh Phúc', 'Yên Bái'];
  var gender = ["Nam","Nữ","Khác"];

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    var controller = new MaskedTextController(mask: '000-000-000');
    controller.beforeChange = (String previous, String next) {
      if (previous.length == 9) {
        controller.updateMask('000-000-000');
      } else {
        controller.updateMask('000-000-000-000');
      }
      return true;
    };

    controller.updateText(widget._cmnd);


//    controller.afterChange = (String previous, String next) {
//      print("$previous | $next");
//    };

    PersonInfo arguments = ModalRoute
        .of(context)
        .settings
        .arguments;
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
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                textCapitalization: TextCapitalization.characters,
                inputFormatters: [
                  UpperCaseTextFormatter(),
                ],
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Vui lòng nhập họ tên';
                  }
                  return null;
                },
                onSaved: (String val) {
                  widget._fullName = val;
//                  print(_fullName);
                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.number,
//              initialValue: widget._cmnd,
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: 'Số CMND',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              validator: (value) {
                widget._cmnd = value;
                if (value.isEmpty) {
                  return 'Vui lòng nhập số chứng minh nhân dân';
                }
                if (value.length != 11) {
                  print(widget._cmnd);
                  return 'Số chứng minh nhân dân không hợp lệ';
                }
//                if (value.length != 15 && arguments.cardType == CardType.cccd){
//                  return 'Số căn cước không hợp lệ';
//                }
                return null;
              },
              onSaved: (String val) {
//                _cmnd = val;
                setState(() {
                  print(controller.text);

                  widget._cmnd = controller.text;
                });
              },
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
                widget._birthday = val;
              },
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate:
                    currentValue ?? DateTime(1995, now.month, now.day),
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
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Vui lòng nhập địa chỉ thường trú';
                }
                return null;
              },
              onSaved: (String val) {
                widget._address = val;
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: DateTimeField(
              decoration: InputDecoration(
                labelText: 'Ngày cấp CMND',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              format: format,
              validator: (value) {
                if (value == null) {
                  return 'Vui lòng nhập ngày cấp CMND';
                }
                return null;
              },
              onSaved: (DateTime val) {
                widget._ngaycap = val;
              },
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate:
                    currentValue ?? DateTime(2015, now.month, now.day),
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
                      Navigator.pushNamed(
                          context, RouteStrings.fillFormEmailPhone);
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

// class TravelCheckbox extends StatefulWidget {
//   TravelCheckbox({Key key}) : super(key: key);

//   @override
//   _TravelCheckboxState createState() => _TravelCheckboxState();
// }

// class _TravelCheckboxState extends State<TravelCheckbox> {
//   @override
//   bool _travel = false;

//   Widget build(BuildContext context) {
//     return ListView(
//       shrinkWrap: true,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 0.0),
//           child: CheckboxListTile(
//               title: const Text('Di chuyển trong nước?'),
//               value: _travel,
//               onChanged: (bool value) {
//                 setState(() {
//                   _travel = value;
//                 });
//               }
//           ),
//         ),
//         Visibility(
//           visible: _travel,
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
//             child: TextFormField(
//               decoration: InputDecoration(
//                   labelText: 'Nơi đi'
//               ),
//               validator: (value) {
//                 if (value.isEmpty) {
//                   return 'Vui lòng nhập nơi đi';
//                 }
//                 return null;
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

Widget _CMNDInput() {
  var controller = new MaskedTextController(mask: '000-000-000');
  controller.beforeChange = (String previous, String next) {
    if (previous.length == 9) {
      controller.updateMask('000-000-000');
    } else {
      controller.updateMask('000-000-000-000');
    }
    return true;
  };

  controller.afterChange = (String previous, String next) {
    print("$previous | $next");
  };

  return new TextFormField(
    controller: controller,
    keyboardType: TextInputType.number,
    inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
    decoration: InputDecoration(
      labelText: 'Số CMND',
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
    ),
    validator: (value) {
      if (value.isEmpty) {
        return 'Vui lòng nhập số chứng minh nhân dân';
      }

      return null;
    },
  );
}
