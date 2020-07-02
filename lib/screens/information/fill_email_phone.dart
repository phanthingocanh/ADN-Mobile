import 'package:adnproject/constants/strings.dart';
import 'package:adnproject/models/declaration.dart';
import 'package:adnproject/models/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:adnproject/models/person_info.dart';
import 'package:adnproject/services/client_api_service.dart';

import '../../models/globals.dart';
import '../../models/globals.dart';

// import 'package:validators/validators.dart' as validate;

class FillEmailPhoneRoute extends StatelessWidget {
  PersonInfo person;
  String email;
  String mobile;
  FillEmailPhoneRoute({
    Key key,
    @required this.person,
    @required this.email,
    @required this.mobile,
  }) : super(key: key);



  @override


  Widget build(BuildContext context) {
    print(email);
    // final appTitle = 'Form Validation Demo';
    return Scaffold(
        appBar: AppBar(
          title: Text(Strings.formInfoTitle),
//          title: Text(name),
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
              MyCustomFormEmailPhone(person: person, email: email, phone: mobile),
            ],
        ),
    );
  }
}

// Create a Form widget.
class MyCustomFormEmailPhone extends StatefulWidget {
  PersonInfo person;
  String email;
  String phone;
  MyCustomFormEmailPhone({this.person, this.email,this.phone});
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
//  final personInfo.PersonInfo person;
  bool _autoValidate = false;
  var _email ;
  var _mobile;
  String countries;
  bool isMoving = false;
  String noidi;
  String noiden;
  String phuongtien;
  DateTime ngaydi;
  DateTime ngayden;




  @override

  Widget build(BuildContext context) {
//    Future<PersonInfo> getPerson() async
//    {
//      return await ClientApiService.instance.getPersonInfoById(widget.person.cmnd);
//    };
//    getPerson().then((personInfo) {
//      print("aa");
//      if (personInfo!=null){
//        // print(personInfo.email);
//        _email=personInfo.email;
//        _mobile=personInfo.phone;
//        print(_email);
//      }
//      else {
//        print("fail");
//      }
//    });
//    print("email2: "+ widget.email);
    final PersonInfo args = ModalRoute.of(context).settings.arguments;
//    RouteSettings settings = ModalRoute.of(context).settings;
//    PersonInfo arguments = settings.arguments;
//    final PersonInfo arguments = ModalRoute
//        .of(context)
//        .settings
//        .arguments;
//    PersonInfo person=PersonInfo(name: arguments.name,
//        cardType: arguments.cardType,
//        cardDate: arguments.cardDate,
//        cardPlace: arguments.cardPlace,
//        cmnd: arguments.cmnd,
//        phone: arguments.phone,
//        birthDay: arguments.birthDay,
//        email: arguments.email,
//        gender: arguments.gender,
//        permanentAddress: arguments.permanentAddress);

    print(widget.email);
    var controller = new MaskedTextController(mask: '0000-000-000');
    controller.updateText(personInfoGlobal.phone);
    controller.beforeChange = (String previous, String next) {
      print("$previous");
      if (previous.length == 12 ) {
        controller.updateMask('0000-000-000');
        widget.phone=controller.text;
        personInfoGlobal.phone=controller.text;
      }
      else{
        controller.updateMask('0000-000-000');
      }

      return true;
    };
    controller.afterChange = (String previous, String next) {
//    print("$previous | $next");
    };
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
            // initialValue: _mobile,
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
              widget.phone = value;
//              print(widget.person.name);
              if (value.isEmpty) {


                return 'Vui lòng nhập số điện thoại';
              }
              else if (!regExp.hasMatch(value)) {
                return 'Số điện thoại không hợp lệ';
              }
              return null;

            },
            onChanged: (String val) {
              personInfoGlobal.phone=val;
              widget.phone=val;
            },
            onSaved: (String val) {
              widget.phone =val;
//              arguments.phone=val;
//              print(args.name);
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
            initialValue: personInfoGlobal.email,

            keyboardType: TextInputType.emailAddress,
            validator: validateEmail,
            onChanged: (String val) {
              widget.email=val;
              personInfoGlobal.email=val;

            },
            onSaved: (String val) {
              widget.email = val;
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
                    
//                    print(arguments.name);
                    print(widget.person.gender);
                    print("Phone: ");
                    print(personInfoGlobal.phone);
                    if (_formKey.currentState.validate()) {
                      //    If all data are correct then save data to out variables
                          _formKey.currentState.save();
                          widget.person.phone=widget.phone;
                          widget.person.email=widget.email;

                          personInfoGlobal.phone=widget.phone;
                          personInfoGlobal.email=widget.email;
                          countries = "";
                          isMoving = false;
                          noiden = "";
                          noidi = "";
                          ngaydi = DateTime(DateTime.now().year, DateTime.now().month);
                          ngayden = DateTime(DateTime.now().year, DateTime.now().month);
                          phuongtien = "";                      
                          Future<Declaration> getDeclare() async
                          {
                            return await ClientApiService.instance.getDeclaration(personInfoGlobal.cmnd);
                          }
                          bool found = false;
                          getDeclare().then((declare) {
                            if (declare != null) {
                              // print(declare.email);
//                              print("khac null");
                              print("Lấy được form travel");
                              countries = declare.countriesVisited;
                              isMoving = declare.isDomesticTravel;
                              noiden = declare.toProvince;
                              noidi = declare.fromProvince;
                              ngaydi = declare.departureDate;
                              ngayden = declare.arrivalDate;
                              phuongtien = declare.travelBy;
                              found = true;
                              // declareGlobal.countriesVisited = declare.countriesVisited;
                              // declareGlobal.isDomesticTravel = declare.isDomesticTravel;
                              // declareGlobal.toProvince = declare.toProvince;
                              // declareGlobal.fromProvince = declare.fromProvince;
                              // declareGlobal.departureDate = declare.departureDate;
                              // declareGlobal.arrivalDate = declare.arrivalDate;
                              // declareGlobal.travelBy= declare.travelBy;
                          }

                          if (declareGlobal.countriesVisited==null){
                            declareGlobal.countriesVisited=countries;     
                          }
                          if (declareGlobal.isDomesticTravel==null){
                            declareGlobal.isDomesticTravel=isMoving;
                          }
                          if (declareGlobal.toProvince==null){
                            declareGlobal.toProvince=noiden;
                          }
                          if (declareGlobal.fromProvince==null){
                            declareGlobal.fromProvince=noidi;
                          }
                          if (declareGlobal.departureDate==null){
                            declareGlobal.departureDate=ngaydi;
                          }
                          if (declareGlobal.arrivalDate==null){
                            declareGlobal.arrivalDate=ngayden;
                          }
                          if (declareGlobal.travelBy==null){
                            declareGlobal.travelBy=phuongtien;
                          }
                            
                          });

                          
                          
//                          print("aa");
//                          print(isMoving);
                      Future delay() async{
                        await new Future.delayed(new Duration(seconds: 1), ()
                        {
                          Navigator.pushNamed(context, RouteStrings.fillFormTravel,arguments: [widget.person, countries, isMoving, ngayden, ngaydi, noiden, noidi, phuongtien]);
                        }
                        );

                      }
                      delay();

//                          Navigator.pushNamed(context, RouteStrings.fillFormTravel,arguments: [widget.person, countries, isMoving, ngayden, ngaydi, noiden, noidi, phuongtien]);
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
  // Pattern pattern =
      // r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
      "\\@" +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
      "(" +
      "\\." +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
      ")+";
  RegExp regex = new RegExp(p);
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
