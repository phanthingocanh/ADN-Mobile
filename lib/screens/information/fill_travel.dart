import 'package:adnproject/constants/strings.dart';
import 'package:adnproject/models/declaration.dart';
import 'package:adnproject/models/person_info.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// import 'package:email_validator/email_validator.dart';
// import 'package:dropdownfield/dropdownfield.dart';

// import 'package:validators/validators.dart' as validate;

class FillTravelRoute extends StatelessWidget {
  PersonInfo person;
  FillTravelRoute({
    Key key,
    @required this.person,
  }) : super(key: key);
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
          MyTravelForm(person: person,),
        ],
      ),
    );
  }
}

// Create a Form widget.
class MyTravelForm extends StatefulWidget {
  PersonInfo person;
  MyTravelForm({this.person});
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
  Declaration declare = new Declaration();


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
              onSaved: (String val){
                declare.countriesVisited=val;
              },
            ),
          ),

          TravelCheckbox(declare: declare,),
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
                      print(widget.person.name);
                      Navigator.pushNamed(
                          context, RouteStrings.fillFormSymptom,
                      arguments: [widget.person,declare]);
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

class TravelCheckbox extends StatefulWidget {
  Declaration declare;
  TravelCheckbox({this.declare});
//  TravelCheckbox({Key key}) : super(key: key);

  @override
  _TravelCheckboxState createState() => _TravelCheckboxState();
}

class _TravelCheckboxState extends State<TravelCheckbox> {
  @override
  bool _travel = false;
  var now = new DateTime.now();


  var currentSelectedValue = 'Hồ Chí Minh';
  var provinceTypes = ['An Giang', 'Bà Rịa-Vũng Tàu', 'Bạc Liêu', 'Bắc Kạn', 'Bắc Giang', 'Bắc Ninh', 'Bến Tre', 'Bình Dương', 'Bình Định', 'Bình Phước', 'Bình Thuận', 'Cà Mau', 'Cao Bằng', 'Cần Thơ', 'Đà Nẵng', 'Đắk Lắk', 'Đắk Nông', 'Điện Biên', 'Đồng Nai', 'Đồng Tháp', 'Gia Lai', 'Hà Giang', 'Hà Nam', 'Hà Nội', 'Hà Tây', 'Hà Tĩnh', 'Hải Dương', 'Hải Phòng', 'Hòa Bình', 'Hồ Chí Minh', 'Hậu Giang', 'Hưng Yên', 'Khánh Hòa', 'Kiên Giang', 'Kon Tum', 'Lai Châu', 'Lào Cai', 'Lạng Sơn', 'Lâm Đồng', 'Long An', 'Nam Định', 'Nghệ An', 'Ninh Bình', 'Ninh Thuận', 'Phú Thọ', 'Phú Yên', 'Quảng Bình', 'Quảng Nam', 'Quảng Ngãi', 'Quảng Ninh', 'Quảng Trị', 'Sóc Trăng', 'Sơn La', 'Tây Ninh', 'Thái Bình', 'Thái Nguyên', 'Thanh Hóa', 'Thừa Thiên - Huế', 'Tiền Giang', 'Trà Vinh', 'Tuyên Quang', 'Vĩnh Long', 'Vĩnh Phúc', 'Yên Bái'];
  final format = DateFormat("yyyy-MM-dd");
  Widget build(BuildContext context) {
    return Column(
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
                widget.declare.isDomesticTravel=value;
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
                            widget.declare.fromProvince=newValue;
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
                            widget.declare.toProvince=newValue;
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
                        initialDate: currentValue ?? DateTime(now.year, now.month),
                        lastDate: DateTime(2100));
                  },
                  onSaved: (DateTime val) {
                    widget.declare.departureDate=val;
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
                  onSaved: (DateTime val) {
                    widget.declare.arrivalDate=val;
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
                  onSaved: (String val) {
                    widget.declare.travelBy=val;
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






