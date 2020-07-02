import 'package:adnproject/constants/strings.dart';
import 'package:adnproject/models/declaration.dart';
import 'package:adnproject/models/globals.dart';
import 'package:adnproject/models/person_info.dart';
import 'package:adnproject/screens/information/fill_symptom.dart';
import 'package:flutter/material.dart';

// import 'package:email_validator/email_validator.dart';
// import 'package:dropdownfield/dropdownfield.dart';

// import 'package:validators/validators.dart' as validate;

class FillMedicalHistoricalRoute extends StatelessWidget {
  PersonInfo person;
  Declaration declare;
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
  FillMedicalHistoricalRoute({
    Key key,
    @required this.person,
    @required this.declare,
    @required this.benhGanManTinh,
    @required this.benhMauManTinh,
    @required this.benhPhoiManTinh,
    @required this.benhThanManTinh,
    @required this.benhTimMach,
    @required this.huyetApCao,
    @required this.suyGiamMienDich,
    @required this.ghepTangHoacXuong,
    @required this.tieuDuong,
    @required this.ungThu,
    @required this.mangThai,

  }) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(Strings.formMedicalHistorical),
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
          MyMedicalHistoricalForm(
            person: person,
            declare: declare,
            benhGanManTinh: benhGanManTinh,
            benhMauManTinh:benhMauManTinh,
            benhPhoiManTinh:benhPhoiManTinh,
            benhThanManTinh:benhThanManTinh,
            benhTimMach:benhTimMach,
            huyetApCao:huyetApCao,
            suyGiamMienDich:suyGiamMienDich,
            ghepTangHoacXuong:ghepTangHoacXuong,
            tieuDuong:tieuDuong,
            ungThu:ungThu,
            mangThai:mangThai,
          ),
        ],
      ),
    );

    
//     return new WillPopScope(
//       onWillPop: _onWillPop,
//       child: new Scaffold(
//       appBar: AppBar(
//         title: Text(Strings.formMedicalHistorical),
//       ),
//       body: ListView(
// //        crossAxisAlignment: CrossAxisAlignment.center,
// //        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           Center(
//             child: Container(
//               padding: EdgeInsets.only(top: 20),
//               child: Text('KHAI BÁO Y TẾ', style: TextStyle(fontSize: 40.0)),
//             ),
//           ),
//           Center(
//             child: Container(
//               padding: EdgeInsets.only(top: 10),
//               child:
//                   Text('Cho khách nội địa', style: TextStyle(fontSize: 25.0)),
//             ),
//           ),
//           Divider(
//             height: 30.0,
//             color: Colors.grey[800],
//           ),
//           MyMedicalHistoricalForm(
//             person: person,
//             declare: declare,
//             benhGanManTinh: benhGanManTinh,
//             benhMauManTinh:benhMauManTinh,
//             benhPhoiManTinh:benhPhoiManTinh,
//             benhThanManTinh:benhThanManTinh,
//             benhTimMach:benhTimMach,
//             huyetApCao:huyetApCao,
//             suyGiamMienDich:suyGiamMienDich,
//             ghepTangHoacXuong:ghepTangHoacXuong,
//             tieuDuong:tieuDuong,
//             ungThu:ungThu,
//             mangThai:mangThai,
//           ),
//         ],
//       ),
//     )
//     );
    // final appTitle = 'Form Validation Demo';
    // return 
  }
}

// Create a Form widget.
class MyMedicalHistoricalForm extends StatefulWidget {
  PersonInfo person;
  Declaration declare;
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
  MyMedicalHistoricalForm({
    this.person, this.declare,
      this.benhGanManTinh,
      this.benhMauManTinh,
      this.benhPhoiManTinh,
      this.benhThanManTinh,
      this.benhTimMach,
      this.huyetApCao,
      this.suyGiamMienDich,
      this.ghepTangHoacXuong,
      this.tieuDuong,
      this.ungThu,
      this.mangThai,

  });
  @override
  MyMedicalHistoricalFormState createState() {
    return MyMedicalHistoricalFormState();
  }
}

class MyMedicalHistoricalFormState extends State<MyMedicalHistoricalForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormEmailPhoneState>.
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    
     return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: Text(
              'Hiện tại Anh/Chị có các bệnh nào dưới đây:',
              style: TextStyle(fontSize: 17),
            ),
          ),
          MedicalHistoricalCheckbox(
            person: widget.person,
            declare: widget.declare,
            benhGanManTinh: widget.benhGanManTinh,
            benhMauManTinh:widget.benhMauManTinh,
            benhPhoiManTinh:widget.benhPhoiManTinh,
            benhThanManTinh: widget.benhThanManTinh,
            benhTimMach: widget.benhTimMach,
            huyetApCao: widget.huyetApCao,
            suyGiamMienDich: widget.suyGiamMienDich,
            ghepTangHoacXuong: widget.ghepTangHoacXuong,
            tieuDuong: widget.tieuDuong,
            ungThu: widget.ungThu,
            mangThai: widget.mangThai,
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

                      Navigator.pushNamed(context, RouteStrings.sendInfoForm,
                          arguments: [widget.person, widget.declare]);
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
    
    // Build a Form widget using the _formKey created above.
    // return Form(
    //   key: _formKey,
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    //       Padding(
    //         padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    //         child: Text(
    //           'Hiện tại Anh/Chị có các bệnh nào dưới đây:',
    //           style: TextStyle(fontSize: 17),
    //         ),
    //       ),
    //       MedicalHistoricalCheckbox(
    //         person: widget.person,
    //         declare: widget.declare,
    //         benhGanManTinh: widget.benhGanManTinh,
    //         benhMauManTinh:widget.benhMauManTinh,
    //         benhPhoiManTinh:widget.benhPhoiManTinh,
    //         benhThanManTinh: widget.benhThanManTinh,
    //         benhTimMach: widget.benhTimMach,
    //         huyetApCao: widget.huyetApCao,
    //         suyGiamMienDich: widget.suyGiamMienDich,
    //         ghepTangHoacXuong: widget.ghepTangHoacXuong,
    //         tieuDuong: widget.tieuDuong,
    //         ungThu: widget.ungThu,
    //         mangThai: widget.mangThai,
    //       ),
    //       new SizedBox(
    //         height: 10.0,
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    //         child: SizedBox(
    //           width: double.infinity,
    //           child: ButtonTheme(
    //             height: 50,
    //             child: RaisedButton(
    //               onPressed: () {
    //                 if (_formKey.currentState.validate()) {
    //                   //    If all data are correct then save data to out variables
    //                   _formKey.currentState.save();

    //                   Navigator.pushNamed(context, RouteStrings.sendInfoForm,
    //                       arguments: [widget.person, widget.declare]);
    //                 } else {
    //                   //    If all data are not valid then start auto validation.
    //                   setState(() {
    //                     _autoValidate = true;
    //                   });
    //                 }
    //               },
    //               color: Colors.blue[400],
    //               child: Text(
    //                 'Tiếp tục',
    //                 style: TextStyle(fontSize: 20, color: Colors.white),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  
  }
}

class MedicalHistoricalCheckbox extends StatefulWidget {
  PersonInfo person;
  Declaration declare;

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
  MedicalHistoricalCheckbox({
    this.person, this.declare,
    this.benhGanManTinh,
    this.benhMauManTinh,
    this.benhPhoiManTinh,
    this.benhThanManTinh,
    this.benhTimMach,
    this.huyetApCao,
    this.suyGiamMienDich,
    this.ghepTangHoacXuong,
    this.tieuDuong,
    this.ungThu,
    this.mangThai,

  });
//  MedicalHistoricalCheckbox({this.person, this.declare});
//  MedicalHistoricalCheckbox({Key key}) : super(key: key);

  @override
  _MedicalHistoricalCheckboxState createState() =>
      _MedicalHistoricalCheckboxState();
}

class _MedicalHistoricalCheckboxState extends State<MedicalHistoricalCheckbox> {
  Map<String, bool> question3 = {
    'Bệnh gan mãn tĩnh': false,
    'Bệnh máu mãn tính': false,
    'Bệnh phổi mãn tính': false,
    'Bệnh thận mãn tính': false,
    'Bệnh tim mạch': false,
    'Huyết áp cao': false,
    'Suy giảm miễn dịch': false,
    'Người nhận ghép tạng , Thủy xương': false,
    'Tiểu đường': false,
    'Ung thư': false,
    'Bạn có đang trong thời gian thai kỳ hay không?': false,
  };

  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillPop() async {
    print("dô");
    print(widget.benhGanManTinh);
    Map<String, bool> myData = new Map();
    myData["benhMauManTinh"]=   widget.benhMauManTinh;
    myData["benhPhoiManTinh"]= widget.benhPhoiManTinh;
    myData["benhThanManTinh"]= widget.benhThanManTinh;
    myData["benhTimMach"]=  widget.benhTimMach;
    myData["huyetApCao"]= widget.huyetApCao;
    myData["suyGiamMienDich"]= widget.suyGiamMienDich;
    myData["ghepTangHoacXuong"]= widget.ghepTangHoacXuong;
    myData["tieuDuong"]= widget.tieuDuong;
    myData["ungThu"]=  widget.ungThu;
    myData["mangThai"]= widget.mangThai;
    myData["benhGanManTinh"]=widget.benhGanManTinh;
    Navigator.pop(context,myData);
    
                            //  "benhMauManTinh":   widget.benhMauManTinh,
                            //   "benhPhoiManTinh" : widget.benhPhoiManTinh,
                            //   "benhThanManTinh" : widget.benhThanManTinh,
                            //   "benhTimMach":  widget.benhTimMach,
                            //   "huyetApCao": widget.huyetApCao,
                            //   "suyGiamMienDich": widget.suyGiamMienDich,
                            //   "ghepTangHoacXuong": widget.ghepTangHoacXuong,
                            //   "tieuDuong" : widget.tieuDuong,
                            //   "ungThu":  widget.ungThu,
                            //   "mangThai": widget.mangThai,
                            //   "benhGanManTinh":widget.benhGanManTinh,
    
    return true;
  }
    question3['Bệnh gan mãn tĩnh']= declareGlobal.benhGanManTinh;
    question3['Bệnh máu mãn tính']= declareGlobal.benhMauManTinh;
    question3['Bệnh phổi mãn tính']= declareGlobal.benhPhoiManTinh;
    question3['Bệnh thận mãn tính']= declareGlobal.benhThanManTinh;
    question3['Bệnh tim mạch']= declareGlobal.benhTimMach;
    question3['Huyết áp cao']= declareGlobal.huyetApCao ;
    question3['Suy giảm miễn dịch']= declareGlobal.suyGiamMienDich ;
    question3['Người nhận ghép tạng , Thủy xương']= declareGlobal.ghepTangHoacXuong
    ;
    question3['Tiểu đường']= declareGlobal.tieuDuong ;
    question3['Ung thư']= declareGlobal.ungThu;
    question3['Bạn có đang trong thời gian thai kỳ hay không?']= declareGlobal.mangThai;


    widget.declare.benhGanManTinh = question3['Bệnh gan mãn tĩnh'];
    widget.declare.benhMauManTinh = question3['Bệnh máu mãn tính'];
    widget.declare.benhPhoiManTinh = question3['Bệnh phổi mãn tính'];
    widget.declare.benhThanManTinh = question3['Bệnh thận mãn tính'];
    widget.declare.benhTimMach = question3['Bệnh tim mạch'];
    widget.declare.huyetApCao = question3['Huyết áp cao'];
    widget.declare.suyGiamMienDich = question3['Suy giảm miễn dịch'];
    widget.declare.ghepTangHoacXuong =
        question3['Người nhận ghép tạng , Thủy xương'];
    widget.declare.tieuDuong = question3['Tiểu đường'];
    widget.declare.ungThu = question3['Ung thư'];
    widget.declare.mangThai =
        question3['Bạn có đang trong thời gian thai kỳ hay không?'];
   return new WillPopScope(
      onWillPop: _onWillPop,
      child:
      Column(
      children: question3.keys.map((String key) {
        return new CheckboxListTile(
          title: new Text(key),
          value: question3[key],
          onChanged: (bool value) {
            setState(() {
              question3[key] = value;
              widget.benhGanManTinh = question3['Bệnh gan mãn tĩnh'];
              widget.benhMauManTinh = question3['Bệnh máu mãn tính'];
              widget.benhPhoiManTinh = question3['Bệnh phổi mãn tính'];
              widget.benhThanManTinh = question3['Bệnh thận mãn tính'];
              widget.benhTimMach = question3['Bệnh tim mạch'];
              widget.huyetApCao = question3['Huyết áp cao'];
              widget.suyGiamMienDich = question3['Suy giảm miễn dịch'];
              widget.ghepTangHoacXuong =
              question3['Người nhận ghép tạng , Thủy xương'];
              widget.tieuDuong = question3['Tiểu đường'];
              widget.ungThu = question3['Ung thư'];
              widget.mangThai =
              question3['Bạn có đang trong thời gian thai kỳ hay không?'];

              declareGlobal.benhGanManTinh = question3['Bệnh gan mãn tĩnh'];
              declareGlobal.benhMauManTinh = question3['Bệnh máu mãn tính'];
              declareGlobal.benhPhoiManTinh = question3['Bệnh phổi mãn tính'];
              declareGlobal.benhThanManTinh = question3['Bệnh thận mãn tính'];
              declareGlobal.benhTimMach = question3['Bệnh tim mạch'];
              declareGlobal.huyetApCao = question3['Huyết áp cao'];
              declareGlobal.suyGiamMienDich = question3['Suy giảm miễn dịch'];
              declareGlobal.ghepTangHoacXuong =
              question3['Người nhận ghép tạng , Thủy xương'];
              declareGlobal.tieuDuong = question3['Tiểu đường'];
              declareGlobal.ungThu = question3['Ung thư'];
              declareGlobal.mangThai =
              question3['Bạn có đang trong thời gian thai kỳ hay không?'];
            });
            widget.declare.benhGanManTinh = question3['Bệnh gan mãn tĩnh'];
            widget.declare.benhMauManTinh = question3['Bệnh máu mãn tính'];
            widget.declare.benhPhoiManTinh = question3['Bệnh phổi mãn tính'];
            widget.declare.benhThanManTinh = question3['Bệnh thận mãn tính'];
            widget.declare.benhTimMach = question3['Bệnh tim mạch'];
            widget.declare.huyetApCao = question3['Huyết áp cao'];
            widget.declare.suyGiamMienDich = question3['Suy giảm miễn dịch'];
            widget.declare.ghepTangHoacXuong =
                question3['Người nhận ghép tạng , Thủy xương'];
            widget.declare.tieuDuong = question3['Tiểu đường'];
            widget.declare.ungThu = question3['Ung thư'];
            widget.declare.mangThai =
                question3['Bạn có đang trong thời gian thai kỳ hay không?'];
          },
        );
      }).toList(),
      )
    );
  }
}
