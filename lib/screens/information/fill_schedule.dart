import 'package:adnproject/constants/strings.dart';
import 'package:adnproject/models/declaration.dart';
import 'package:adnproject/models/globals.dart';
import 'package:adnproject/models/person_info.dart';
import 'package:adnproject/screens/animation/slide.dart';
import 'package:adnproject/services/client_api_service.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'dart:convert';

import 'fill_medical_historical.dart';

// import 'package:email_validator/email_validator.dart';
// import 'package:dropdownfield/dropdownfield.dart';

// import 'package:validators/validators.dart' as validate;



class FillScheduleRoute extends StatelessWidget {
  bool nguoiBenh;
  bool nguoiCoBieuHien;
  bool nguoiTuNuocCoBenh;
  PersonInfo person;
  Declaration declare;
  FillScheduleRoute({
    Key key,
    @required this.person,
    @required this.declare,
    @required this.nguoiBenh,
    @required this.nguoiTuNuocCoBenh,
    @required this.nguoiCoBieuHien,

  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    // final appTitle = 'Form Validation Demo';
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.formSchedule),
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
          MyScheduleForm(
            person: person,
            declare: declare,
            nguoiBenh: nguoiBenh,
            nguoiTuNuocCoBenh: nguoiTuNuocCoBenh,
            nguoiCoBieuHien: nguoiCoBieuHien,
          ),
        ],
      ),
    );
  }
}

// Create a Form widget.
class MyScheduleForm extends StatefulWidget {
  PersonInfo person;
  Declaration declare;
  bool nguoiBenh;
  bool nguoiCoBieuHien;
  bool nguoiTuNuocCoBenh;
  MyScheduleForm({this.person, this.declare,
    this.nguoiBenh,
    this.nguoiTuNuocCoBenh,
    this.nguoiCoBieuHien,

  });
  @override
  MyScheduleFormState createState() {
    return MyScheduleFormState();
  }
}

class MyScheduleFormState extends State<MyScheduleForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormEmailPhoneState>.
  final _formKey = GlobalKey<FormState>();
  bool benhGanManTinh;
  bool benhMauManTinh;
  bool benhPhoiManTinh;
  bool benhThanManTinh;
  bool benhTimMach;
  bool huyetApCao;
  bool suyGiamMienDich;
  bool ghepTangHoacXuong;
  bool tieuDuong;
  bool ungThu;
  bool mangThai;
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
//    ClientApiService.instance
//        .getDeclaration(widget.person.cmnd)
//        .then((declare) {
//      if (declare != null) {
//        // print(declare.email);
//        widget.declare.nguoiBenh = declare.nguoiBenh;
//        widget.declare.nguoiCoBieuHien = declare.nguoiCoBieuHien;
//        widget.declare.nguoiTuNuocCoBenh =declare.nguoiTuNuocCoBenh;
//
//      } else {
//        print("fail");
//      }
//    });
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: Text(
              'Trong vòng 14 ngày qua, Anh/Chị có tiếp xúc với:',
              style: TextStyle(fontSize: 17),
            ),
          ),
          ScheduleCheckbox(
            person: widget.person,
            declare: widget.declare,
            nguoiBenh: widget.nguoiBenh,
            nguoiTuNuocCoBenh: widget.nguoiTuNuocCoBenh,
            nguoiCoBieuHien: widget.nguoiCoBieuHien,
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
//                        await new Future.delayed(const Duration(seconds: 3));
                        return await ClientApiService.instance.getDeclaration(widget.person.cmnd);
                      }
//                      benhGanManTinh=false;
//                      benhMauManTinh= false;
//                      benhPhoiManTinh= false;
//                      benhThanManTinh= false;
//                      benhTimMach= false;
//                      huyetApCao= false;
//                      suyGiamMienDich= false;
//                      ghepTangHoacXuong= false;
//                      tieuDuong= false;
//                      ungThu= false;
//                      mangThai= false;
//
//                      getDeclare().then((declare) {
//                        if (declare != null) {
//                          // print(declare.email);
////                              print("khac null");
//                          benhGanManTinh=declare.benhGanManTinh;
//                          benhMauManTinh=declare.benhMauManTinh;
//                          benhPhoiManTinh=declare.benhPhoiManTinh;
//                          benhThanManTinh=declare.benhThanManTinh;
//                          benhTimMach=declare.benhTimMach;
//                          huyetApCao=declare.huyetApCao;
//                          suyGiamMienDich=declare.suyGiamMienDich;
//                          ghepTangHoacXuong=declare.ghepTangHoacXuong;
//                          tieuDuong=declare.tieuDuong;
//                          ungThu=declare.ungThu;
//                          mangThai=declare.mangThai;
//
//                          // declareGlobal.benhGanManTinh=declare.benhGanManTinh;
//                          // declareGlobal.benhMauManTinh=declare.benhMauManTinh;
//                          // declareGlobal.benhPhoiManTinh=declare.benhPhoiManTinh;
//                          // declareGlobal.benhThanManTinh=declare.benhThanManTinh;
//                          // declareGlobal.benhTimMach=declare.benhTimMach;
//                          // declareGlobal.huyetApCao=declare.huyetApCao;
//                          // declareGlobal.suyGiamMienDich=declare.suyGiamMienDich;
//                          // declareGlobal.ghepTangHoacXuong=declare.ghepTangHoacXuong;
//                          // declareGlobal.tieuDuong=declare.tieuDuong;
//                          // declareGlobal.ungThu=declare.ungThu;
//                          // declareGlobal.mangThai=declare.mangThai;
//
//                        }
//
//                        if (declareGlobal.benhGanManTinh==null){
//                        declareGlobal.benhGanManTinh=benhGanManTinh;
//                      }
//                      if (declareGlobal.benhMauManTinh==null){
//                        declareGlobal.benhMauManTinh=benhMauManTinh;
//                      }
//                      if (declareGlobal.benhPhoiManTinh==null){
//                        declareGlobal.benhPhoiManTinh=benhPhoiManTinh;
//                      }
//                      if (declareGlobal.benhThanManTinh==null){
//                        declareGlobal.benhThanManTinh=benhThanManTinh;
//                      }
//                      if (declareGlobal.benhTimMach==null){
//                        declareGlobal.benhTimMach=benhTimMach;
//                      }
//                      if (declareGlobal.huyetApCao==null){
//                        declareGlobal.huyetApCao=huyetApCao;
//                      }
//                      if (declareGlobal.suyGiamMienDich==null){
//                        declareGlobal.suyGiamMienDich=suyGiamMienDich;
//                      }
//                      if (declareGlobal.ghepTangHoacXuong==null){
//                        declareGlobal.ghepTangHoacXuong=ghepTangHoacXuong;
//                      }
//                      if (declareGlobal.tieuDuong==null){
//                        declareGlobal.tieuDuong=tieuDuong;
//                      }
//                      if (declareGlobal.mangThai==null){
//                        declareGlobal.mangThai=mangThai;
//                      }
//                      if (declareGlobal.ungThu==null){
//                        declareGlobal.ungThu=ungThu;
//                      }
//
//                      });

                      
                      
                    
                      Future delay() async{
                        await new Future.delayed(new Duration(seconds: 1), 
                        ()async {  
                           
                            Navigator.pushNamed(context, RouteStrings.fillFormMedicalHistorical, 
                            arguments: [widget.person, widget.declare,
                                benhMauManTinh,
                                benhPhoiManTinh,
                                benhThanManTinh,
                                benhTimMach,
                                huyetApCao,
                                suyGiamMienDich,
                                ghepTangHoacXuong,
                                tieuDuong,
                                ungThu,
                                mangThai,
                                benhGanManTinh,
                              ]);
                            
                              
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

class ScheduleCheckbox extends StatefulWidget {
  PersonInfo person;
  Declaration declare;
  bool nguoiBenh;
  bool nguoiCoBieuHien;
  bool nguoiTuNuocCoBenh;
  ScheduleCheckbox({this.person, this.declare, this.nguoiBenh,
    this.nguoiTuNuocCoBenh,
    this.nguoiCoBieuHien,});

//  ScheduleCheckbox({Key key}) : super(key: key);

  @override
  _ScheduleCheckboxState createState() => _ScheduleCheckboxState();
}

class _ScheduleCheckboxState extends State<ScheduleCheckbox> {
  Map<String, bool> question2 = {
    'Người bệnh hoặc nghi ngờ, mắc bệnh COVID-19': false,
    'Người từ nước có bệnh COVID-19': false,
    'Người có biểu hiện (Sốt, ho, khó thở , Viêm phổi)': false,
  };

  @override
  Widget build(BuildContext context) {

    question2['Người bệnh hoặc nghi ngờ, mắc bệnh COVID-19'] = declareGlobal.nguoiBenh;
    question2['Người từ nước có bệnh COVID-19'] = declareGlobal.nguoiTuNuocCoBenh;
    question2['Người có biểu hiện (Sốt, ho, khó thở , Viêm phổi)'] = declareGlobal.nguoiCoBieuHien;
    

    widget.declare.nguoiBenh =
        question2['Người bệnh hoặc nghi ngờ, mắc bệnh COVID-19'];
    widget.declare.nguoiTuNuocCoBenh =
        question2['Người từ nước có bệnh COVID-19'];
    widget.declare.nguoiCoBieuHien =
        question2['Người có biểu hiện (Sốt, ho, khó thở , Viêm phổi)'];

    return ListView(
      shrinkWrap: true,
      children: question2.keys.map((String key) {
        return new CheckboxListTile(
          title: new Text(key),
          value: question2[key],
          onChanged: (bool value) {
            setState(() {
              question2[key] = value;
              widget.nguoiBenh =
              question2['Người bệnh hoặc nghi ngờ, mắc bệnh COVID-19'];
              widget.nguoiTuNuocCoBenh =
              question2['Người từ nước có bệnh COVID-19'];
              widget.nguoiCoBieuHien =
              question2['Người có biểu hiện (Sốt, ho, khó thở , Viêm phổi)'];

              declareGlobal.nguoiBenh =
              question2['Người bệnh hoặc nghi ngờ, mắc bệnh COVID-19'];
              declareGlobal.nguoiTuNuocCoBenh =
              question2['Người từ nước có bệnh COVID-19'];
              declareGlobal.nguoiCoBieuHien =
              question2['Người có biểu hiện (Sốt, ho, khó thở , Viêm phổi)'];
            });
            widget.declare.nguoiBenh =
                question2['Người bệnh hoặc nghi ngờ, mắc bệnh COVID-19'];
            widget.declare.nguoiTuNuocCoBenh =
                question2['Người từ nước có bệnh COVID-19'];
            widget.declare.nguoiCoBieuHien =
                question2['Người có biểu hiện (Sốt, ho, khó thở , Viêm phổi)'];
          },
        );
      }).toList(),
    );
  }
}
