import 'package:adnproject/constants/strings.dart';
import 'package:flutter/material.dart';

// import 'package:email_validator/email_validator.dart';
// import 'package:dropdownfield/dropdownfield.dart';

// import 'package:validators/validators.dart' as validate;

class FillMedicalHistoricalRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final appTitle = 'Form Validation Demo';
    return Scaffold(
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
          MyMedicalHistoricalForm(),
        ],
      ),
    );
  }
}

// Create a Form widget.
class MyMedicalHistoricalForm extends StatefulWidget {
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
    // Build a Form widget using the _formKey created above.
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
          MedicalHistoricalCheckbox(),
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
                      Navigator.pushNamed(context, RouteStrings.sendInfoForm);
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

class MedicalHistoricalCheckbox extends StatefulWidget {
  MedicalHistoricalCheckbox({Key key}) : super(key: key);

  @override
  _MedicalHistoricalCheckboxState createState() =>
      _MedicalHistoricalCheckboxState();
}

class _MedicalHistoricalCheckboxState extends State<MedicalHistoricalCheckbox> {
  Map<String, bool> question3 = {
    'Bệnh gan mãn tĩnh': false,
    'Bệnh máu mãn tính': false,
    'Bệnh phổi mãn tính': false,
    'Bệnh thận mãn tĩnh': false,
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
    return Column(
      children: question3.keys.map((String key) {
        return new CheckboxListTile(
          title: new Text(key),
          value: question3[key],
          onChanged: (bool value) {
            setState(() {
              question3[key] = value;
            });
          },
        );
      }).toList(),
    );
  }
}
