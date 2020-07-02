import 'package:adnproject/constants/strings.dart';
import 'package:adnproject/models/declaration.dart';
import 'package:adnproject/models/globals.dart';
import 'package:adnproject/models/person_info.dart';
import 'package:adnproject/services/client_api_service.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// import 'package:email_validator/email_validator.dart';
// import 'package:dropdownfield/dropdownfield.dart';

// import 'package:validators/validators.dart' as validate;

class FillTravelRoute extends StatelessWidget {
  PersonInfo person;
  String countries;
  bool isMoving;
  String noidi;
  String noiden;
  String phuongtien;
  DateTime ngaydi;
  DateTime ngayden;
  FillTravelRoute({
    Key key,
    @required this.person,
    @required this.countries,
    @required this.isMoving,
    @required this.ngaydi,
    @required this.ngayden,
    @required this.noidi,
    @required this.noiden,
    @required this.phuongtien,

  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("route"+isMoving.toString());
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
          MyTravelForm(
            person: person,
            countries: countries,
            isMoving:isMoving,
            ngaydi:ngaydi,
            ngayden:ngayden,
            noidi:noidi,
            noiden:noiden,
            phuongtien:phuongtien,

          ),
        ],
      ),
    );
  }
}

// Create a Form widget.
class MyTravelForm extends StatefulWidget {
  PersonInfo person;
  String countries;
  bool isMoving = false;
  String noidi;
  String noiden;
  String phuongtien;
  DateTime ngaydi;
  DateTime ngayden;
  MyTravelForm({this.person,
     this.countries,
     this.isMoving,
     this.ngaydi,
     this.ngayden,
     this.noidi,
     this.noiden,
     this.phuongtien,
  });
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
  bool sot, ho, khoTho, viemPhoi, dauHong, metMoi;

  Declaration declare = new Declaration();
//  String countries;
//  bool isMoving = false;
//  String noidi;
//  String noiden;
//  String phuongtien;
//  DateTime ngaydi;
//  DateTime ngayden;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
//    ClientApiService.instance
//        .getDeclaration(widget.person.cmnd)
//        .then((declare) {
//      if (declare != null) {
//        // print(declare.email);
//        countries = declare.countriesVisited;
//        isMoving = declare.isDomesticTravel;
//        noiden = declare.toProvince;
//        noidi = declare.fromProvince;
//        ngaydi = declare.departureDate;
//        ngayden = declare.arrivalDate;
//        phuongtien = declare.travelBy;
//      } else {
//        print("fail");
//      }
//    });
    print("form"+widget.isMoving.toString());

    return Form(
      key: _formKey,
      autovalidate: _autoValidate,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: Text(
              'Trong vòng 14 ngày qua, anh/chị có đi đến quốc gia/vùng lãnh thổ nào?',
              style: TextStyle(fontSize: 17),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: TextFormField(
              maxLines: 4,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                hintText:
                    'Nhập tên các quốc gia/vùng lãnh thổ đã đi qua (nếu có)',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              initialValue: declareGlobal.countriesVisited,
              onChanged: (String val){
                declareGlobal.countriesVisited=val;
              },
              validator: (value) {
                return null;
              },
              onSaved: (String val) {
                declare.countriesVisited = val;
              },
            ),
          ),
          TravelCheckbox(
            declare: declare,
            isMoving: widget.isMoving,
            ngaydi: widget.ngaydi,
            ngayden: widget.ngayden,
            noidi: widget.noidi,
            noiden: widget.noiden,
            phuongtien: widget.phuongtien,
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
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      //    If all data are correct then save data to out variables
                      _formKey.currentState.save();
//                      print(widget.person.name);
                      Future<Declaration> getDeclare() async
                      {
//                        await new Future.delayed(const Duration(seconds: 3));
                        return await ClientApiService.instance.getDeclaration(widget.person.cmnd);
                      }
                      sot = false;
                      ho = false;
                      khoTho = false;
                      viemPhoi = false;
                      dauHong = false;
                      metMoi = false;
                       
                      
                      getDeclare().then((declare) {
                        if (declare != null) {
                          // print(declare.email);
//                              print("khac null");
                          // declareGlobal.sot = declare.sot;
                          // declareGlobal.ho = declare.ho;
                          // declareGlobal.khoTho =declare.khoTho;
                          // declareGlobal.viemPhoi = declare.viemPhoi;
                          // declareGlobal.dauHong = declare.dauHong;
                          // declareGlobal.metMoi = declare.metMoi;

                          sot = declare.sot;
                          ho = declare.ho;
                          khoTho =declare.khoTho;
                          viemPhoi = declare.viemPhoi;
                          dauHong = declare.dauHong;
                          metMoi = declare.metMoi;                          
                        }
                         if (declareGlobal.sot==null){
                          declareGlobal.sot=sot;
                          }
                          if (declareGlobal.ho==null){
                            declareGlobal.ho=ho;
                          }
                          if (declareGlobal.khoTho==null){
                            declareGlobal.khoTho=khoTho;
                          }
                          if (declareGlobal.viemPhoi==null){
                            declareGlobal.viemPhoi=viemPhoi;
                          }
                          if (declareGlobal.dauHong==null){
                            declareGlobal.dauHong=dauHong;
                          }
                          if (declareGlobal.metMoi==null){
                            declareGlobal.metMoi=metMoi;
                          }
                        
                      });
                     
                      
                          
                      print(declare.fromProvince.toString());
                      Future delay() async{
                        await new Future.delayed(new Duration(seconds: 1), ()
                        {
                          Navigator.pushNamed(context, RouteStrings.fillFormSymptom,
                              arguments: [widget.person, declareGlobal, sot, ho, khoTho, viemPhoi, dauHong, metMoi]);
                        }
                        );

                      }
                      delay();

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
  bool isMoving;
  String noidi;
  String noiden;
  String phuongtien;
  DateTime ngaydi;
  DateTime ngayden;

  TravelCheckbox({
    this.declare,
    this.isMoving,
    this.noidi,
    this.noiden,
    this.phuongtien,
    this.ngaydi,
    this.ngayden,
  });
//  TravelCheckbox({Key key}) : super(key: key);

  @override
  _TravelCheckboxState createState() => _TravelCheckboxState();
}

class _TravelCheckboxState extends State<TravelCheckbox> {
  @override
  // bool _travel = false;
  var now = new DateTime.now();

  var provinceTypes = [
    'An Giang',
    'Bà Rịa-Vũng Tàu',
    'Bạc Liêu',
    'Bắc Kạn',
    'Bắc Giang',
    'Bắc Ninh',
    'Bến Tre',
    'Bình Dương',
    'Bình Định',
    'Bình Phước',
    'Bình Thuận',
    'Cà Mau',
    'Cao Bằng',
    'Cần Thơ',
    'Đà Nẵng',
    'Đắk Lắk',
    'Đắk Nông',
    'Điện Biên',
    'Đồng Nai',
    'Đồng Tháp',
    'Gia Lai',
    'Hà Giang',
    'Hà Nam',
    'Hà Nội',
    'Hà Tây',
    'Hà Tĩnh',
    'Hải Dương',
    'Hải Phòng',
    'Hòa Bình',
    'Hồ Chí Minh',
    'Hậu Giang',
    'Hưng Yên',
    'Khánh Hòa',
    'Kiên Giang',
    'Kon Tum',
    'Lai Châu',
    'Lào Cai',
    'Lạng Sơn',
    'Lâm Đồng',
    'Long An',
    'Nam Định',
    'Nghệ An',
    'Ninh Bình',
    'Ninh Thuận',
    'Phú Thọ',
    'Phú Yên',
    'Quảng Bình',
    'Quảng Nam',
    'Quảng Ngãi',
    'Quảng Ninh',
    'Quảng Trị',
    'Sóc Trăng',
    'Sơn La',
    'Tây Ninh',
    'Thái Bình',
    'Thái Nguyên',
    'Thanh Hóa',
    'Thừa Thiên - Huế',
    'Tiền Giang',
    'Trà Vinh',
    'Tuyên Quang',
    'Vĩnh Long',
    'Vĩnh Phúc',
    'Yên Bái'
  ];
  var noidi;
  var noiden;
  final format = DateFormat("yyyy-MM-dd");
 
  Widget build(BuildContext context) {
    if (declareGlobal.fromProvince==""){
      noidi = 'Hồ Chí Minh';      
    }
    else{
      noidi=declareGlobal.fromProvince;
    }
    if (declareGlobal.toProvince==""){
      noiden = 'Hồ Chí Minh';
    }
    else{
      noiden = declareGlobal.toProvince;
    }
    
    print("isMoving: ");
    print(widget.isMoving);
    print("global");
    print(declareGlobal.isDomesticTravel);
    widget.declare.isDomesticTravel = widget.isMoving;
    widget.declare.fromProvince = "";
    widget.declare.toProvince = "";
    widget.declare.arrivalDate = DateTime.now();
    widget.declare.departureDate = DateTime.now();
    widget.declare.travelBy = "";

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(5.0, 10.0, 20.0, 0.0),
          child: CheckboxListTile(
              title: Text(
                'Di chuyển trong nước?',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              value: declareGlobal.isDomesticTravel,
              onChanged: (bool value) {
                widget.declare.isDomesticTravel = value;
                setState(() {
                  widget.isMoving = value;
                  widget.declare.isDomesticTravel = value;
                  declareGlobal.isDomesticTravel=value;
                });
              }),
        ),
        Column(
          children: <Widget>[
            Visibility(
              visible: declareGlobal.isDomesticTravel,
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
                          value: noidi,
                          isDense: true,
                          onChanged: (newValue) {
                            widget.declare.fromProvince = newValue;
                            setState(() {
                              noidi = newValue;
                              widget.noidi=newValue;
                              widget.declare.fromProvince = newValue;
                              declareGlobal.fromProvince=newValue;

                            });
                            print(noidi);
//                            print(currentSelectedValue1);
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
              visible: declareGlobal.isDomesticTravel,
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
                          value: noiden,
                          isDense: true,
                          onChanged: (newValue) {
                            widget.declare.toProvince = newValue;
                            setState(() {
                              noiden = newValue;
                              widget.noiden=newValue;
                              widget.declare.toProvince = newValue;
                              declareGlobal.toProvince =newValue;


                            });
//                            print(currentSelectedValue);
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
              visible: declareGlobal.isDomesticTravel,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: DateTimeField(
                  decoration: InputDecoration(
                    labelText: 'Ngày đi',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  format: format,
                  initialValue: declareGlobal.departureDate,
                  onChanged: (DateTime departureDate){
                    declareGlobal.departureDate =departureDate;
                  },
                  onShowPicker: (context, currentValue) {
//                    widget.ngaydi=currentValue;
                    declareGlobal.departureDate =currentValue;
                    return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? declareGlobal.departureDate,
                        lastDate: DateTime(2100));
                  },
                  onSaved: (DateTime val) {
                    widget.declare.departureDate = val;
                    declareGlobal.departureDate =val;
                  },
                ),
              ),
            ),
            Visibility(
              visible: declareGlobal.isDomesticTravel,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: DateTimeField(
                  decoration: InputDecoration(
                    labelText: 'Ngày đến',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  format: format,
                  initialValue: declareGlobal.arrivalDate,
                  onChanged: (DateTime arrivalDate){
                    declareGlobal.arrivalDate =arrivalDate;
                  },
                  onShowPicker: (context, currentValue) {
//                    currentValue=widget.ngayden;
                    
                    return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        
                        initialDate: currentValue ?? declareGlobal.arrivalDate,
                        lastDate: DateTime(2100));
                  },
                  onSaved: (DateTime val) {
                    widget.declare.arrivalDate = val;
                  },
                ),
              ),
            ),
            Visibility(
              visible: declareGlobal.isDomesticTravel,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Phương tiện di chuyển',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  initialValue: declareGlobal.travelBy,
                  onChanged: (String val) {
                    declareGlobal.travelBy=val;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Vui lòng nhập phương tiện di chuyển';
                    }
                    return null;
                  },
                  onSaved: (String val) {
                    widget.declare.travelBy = val;
                    declareGlobal.travelBy=val;
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
