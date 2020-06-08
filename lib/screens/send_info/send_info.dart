import 'package:adnproject/constants/strings.dart';
import 'package:flutter/material.dart';

class SendInfoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final appTitle = 'Form Validation Demo';
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.sendInfoTitle),
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
          MySendInfoForm(),
        ],
      ),
    );
  }
}

class MySendInfoForm extends StatefulWidget {
  @override
  MySendInfoFormState createState() {
    return MySendInfoFormState();
  }
}

class MySendInfoFormState extends State<MySendInfoForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormEmailPhoneState>.
  final _formKey = GlobalKey<FormState>();

  bool _autoValidate = false;
  String _email;
  String _mobile;

  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 60,
                    )),
                Expanded(
                    flex: 3,
                    child: Text(
                        "Dữ liệu được gửi thành công. \nCảm ơn bạn đã tham gia khai báo y tế!")),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Đóng'),
                onPressed: () =>
                    Navigator.pushNamed(context, RouteStrings.home),
              )
            ],
          );
        });
  }

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
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Mã bảo mật',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Vui lòng nhập mã bảo mật';
                }
                return null;
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
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: Text(
              'Vui lòng kiểm tra lại thông tin trước khi gửi tờ khai.',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: Text(
              'Dữ liệu bạn cung cấp hoàn toàn bảo mật, chỉ phục vụ cho mục đích phòng chống dịch COVID-19.',
              style: TextStyle(
                fontSize: 17,
              ),
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
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      //    If all data are correct then save data to out variables
                      _formKey.currentState.save();
                      createAlertDialog(context);
                    } else {
                      //    If all data are not valid then start auto validation.
                      setState(() {
                        _autoValidate = true;
                      });
                    }
                  },
                  color: Colors.blue[400],
                  child: Text(
                    'Gửi tờ khai',
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
