import 'package:adnproject/constants/strings.dart';
import 'package:adnproject/models/declaration.dart';
import 'package:adnproject/models/globals.dart';
import 'package:adnproject/models/person_info.dart';
import 'package:adnproject/services/client_api_service.dart';
import 'package:flutter/material.dart';

// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
// import 'package:intl/intl.dart';
// import 'package:email_validator/email_validator.dart';
// import 'package:dropdownfield/dropdownfield.dart';

// import 'package:validators/validators.dart' as validate;

class FillSymptomRoute extends StatelessWidget {
  PersonInfo person;
  Declaration declare;
  bool sot, ho, khoTho, viemPhoi, dauHong, metMoi;

  FillSymptomRoute({
    Key key,
     this.person,
     this.declare,
     this.sot,
     this.ho,
     this.khoTho,
     this.viemPhoi,
     this.dauHong,
     this.metMoi,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final appTitle = 'Form Validation Demo';
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.formSymptom),
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
          MySymptomForm(
            person: person,
            declare: declare,
            sot: sot,
            ho: ho,
            viemPhoi: viemPhoi,
            khoTho: khoTho,
            dauHong: dauHong,
            metMoi: metMoi,
          ),
        ],
      ),
    );
  }
}

// Create a Form widget.
class MySymptomForm extends StatefulWidget {
  PersonInfo person;
  Declaration declare;
  bool sot, ho, khoTho, viemPhoi, dauHong, metMoi;



  MySymptomForm({this.person, this.declare,
     this.sot,
     this.ho,
     this.khoTho,
     this.viemPhoi,
     this.dauHong,
     this.metMoi, });
  @override
  MySymptomFormState createState() {
    return MySymptomFormState();
  }
}

class MySymptomFormState extends State<MySymptomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormEmailPhoneState>.
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
//  bool sot, ho, khoTho, viemPhoi, dauHong, metMoi;
  bool nguoiBenh;
  bool nguoiCoBieuHien;
  bool nguoiTuNuocCoBenh;

  @override
  Widget build(BuildContext context) {
//     ClientApiService.instance
//        .getDeclaration(widget.person.cmnd)
//        .then((declare) {
//      if (declare != null) {
//        // print(declare.email);
//        widget.sot = declare.sot;
//        ho = declare.ho;
//        khoTho =declare.khoTho;
//        viemPhoi = declare.viemPhoi;
//        dauHong = declare.dauHong;
//        metMoi = declare.metMoi;
//        print("Sot1: "+ sot.toString());
//
//
//      } else {
//        print("fail");
//      }
//    });
//    print("Sot2: "+ sot.toString());

    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: Text(
              'Trong vòng 14 ngày qua Anh/Chị có thấy xuất hiện dấu hiệu nào sau đây không?',
              style: TextStyle(fontSize: 17),
            ),
          ),
          SymptomCheckbox(
            person: widget.person,
            declare: widget.declare,
            sot: widget.sot,
            ho: widget.ho,
            viemPhoi: widget.viemPhoi,
            khoTho: widget.khoTho,
            dauHong: widget.dauHong,
            metMoi: widget.metMoi,
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
                      Future<Declaration> getDeclare() async
                      {

                        return await ClientApiService.instance.getDeclaration(widget.person.cmnd);
                      }
//                      nguoiBenh=false;
//                      nguoiCoBieuHien=false;
//                      nguoiTuNuocCoBenh=false;
//
//
//                      getDeclare().then((declare) {
//                        if (declare != null) {
//                          // print(declare.email);
////                              print("khac null");
//                          nguoiBenh=declare.nguoiBenh;
//                          nguoiCoBieuHien=declare.nguoiCoBieuHien;
//                          nguoiTuNuocCoBenh=declare.nguoiTuNuocCoBenh;
//
//                          // declareGlobal.nguoiBenh=declare.nguoiBenh;
//                          // declareGlobal.nguoiCoBieuHien=declare.nguoiCoBieuHien;
//                          // declareGlobal.nguoiTuNuocCoBenh=declare.nguoiTuNuocCoBenh;
//                        }
//
//                        if (declareGlobal.nguoiBenh==null){
//                        declareGlobal.nguoiBenh=nguoiBenh;
//                      }
//                      if (declareGlobal.nguoiCoBieuHien==null){
//                        declareGlobal.nguoiCoBieuHien=nguoiCoBieuHien;
//                      }
//                      if (declareGlobal.nguoiTuNuocCoBenh==null){
//                        declareGlobal.nguoiTuNuocCoBenh=nguoiTuNuocCoBenh;
//                      }
//
//
//                      });
                      Future delay() async{
                        await new Future.delayed(new Duration(seconds: 1), ()
                        {
                          Navigator.pushNamed(
                              context, RouteStrings.fillFormSchedule,
                              arguments: [widget.person, widget.declare, nguoiBenh, nguoiTuNuocCoBenh, nguoiCoBieuHien]);
                        }
                        );

                      }
                      delay();
//                      Navigator.pushNamed(
//                          context, RouteStrings.fillFormSchedule,
//                          arguments: [widget.person, widget.declare, nguoiBenh, nguoiTuNuocCoBenh, nguoiCoBieuHien]);
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

class SymptomCheckbox extends StatefulWidget {
  PersonInfo person;
  Declaration declare;
  bool sot, ho, khoTho, viemPhoi, dauHong, metMoi;

  SymptomCheckbox({this.person, this.declare, this.sot, this.ho, this.khoTho, this.viemPhoi, this.dauHong, this.metMoi});

  
//  SymptomCheckbox({Key key}) : super(key: key);

  @override
  _SymptomCheckboxState createState() { 
    print("aaa" + sot.toString());
     return _SymptomCheckboxState();
    }
}

class _SymptomCheckboxState extends State<SymptomCheckbox> {
  Map<String, bool> question1 = {
    'Sốt': false,
    'Ho': false,
    'Khó thở': false,
    'Viêm phổi': false,
    'Đau họng': false,
    'Mệt mỏi': false,
  };
 
  @override
  Widget build(BuildContext context) {
    print("from checkbox: " + widget.sot.toString());

    print(widget.sot);
    question1["Sốt"] = declareGlobal.sot;
    question1["Ho"] = declareGlobal.ho;
    question1["Khó thở"] = declareGlobal.khoTho;
    question1["Viêm phổi"]=declareGlobal.viemPhoi;
    question1["Đau họng"] = declareGlobal.dauHong;
    question1["Mệt mỏi"] = declareGlobal.metMoi;

    widget.declare.sot = question1["Sốt"];
    widget.declare.ho = question1["Ho"];
    widget.declare.khoTho = question1["Khó thở"];
    widget.declare.viemPhoi = question1["Viêm phổi"];
    widget.declare.dauHong = question1["Đau họng"];
    widget.declare.metMoi = question1["Mệt mỏi"];
    return Column(
      children: question1.keys.map((String key) {
        return new CheckboxListTile(
          title: new Text(key),
          value: question1[key],
          onChanged: (bool value) {
            setState(() {
              question1[key] = value;
              widget.sot = question1["Sốt"];
              widget.ho = question1["Ho"];
              widget.khoTho = question1["Khó thở"];
              widget.viemPhoi = question1["Viêm phổi"];
              widget.dauHong = question1["Đau họng"];
              widget.metMoi = question1["Mệt mỏi"];

              declareGlobal.sot = question1["Sốt"];
              declareGlobal.ho = question1["Ho"];
              declareGlobal.khoTho = question1["Khó thở"];
              declareGlobal.viemPhoi = question1["Viêm phổi"];
              declareGlobal.dauHong = question1["Đau họng"];
              declareGlobal.metMoi = question1["Mệt mỏi"];
            });
            widget.declare.sot = question1["Sốt"];
            widget.declare.ho = question1["Ho"];
            widget.declare.khoTho = question1["Khó thở"];
            widget.declare.viemPhoi = question1["Viêm phổi"];
            widget.declare.dauHong = question1["Đau họng"];
            widget.declare.metMoi = question1["Mệt mỏi"];
          },
        );
      }).toList(),
    );
  }
}
