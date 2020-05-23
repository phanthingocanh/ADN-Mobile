import 'package:adnproject/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
// import 'package:email_validator/email_validator.dart';
// import 'package:dropdownfield/dropdownfield.dart';

// import 'package:validators/validators.dart' as validate;

class FillScheduleRoute extends StatelessWidget {
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
          MyScheduleForm(),
        ],
      ),
    );
  }
}

// Create a Form widget.
class MyScheduleForm extends StatefulWidget {
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
            child: Text('Trong vòng 14 ngày qua, Anh/Chị có tiếp xúc với:',
              style: TextStyle(
                fontSize: 17
              ),
            ),
          ),

          ScheduleCheckbox(),
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
                      Navigator.pushNamed(context, RouteStrings.fillFormMedicalHistorical);

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

class ScheduleCheckbox extends StatefulWidget {
  ScheduleCheckbox({Key key}) : super(key: key);

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
    return ListView(
      shrinkWrap: true,
      children: question2.keys.map((String key) {
          return new CheckboxListTile(
            title: new Text(key),
            value: question2[key],
            onChanged: (bool value) {
              setState(() {
                question2[key] = value;
              });
            },
          );
        }).toList(),
    );
  }
}






