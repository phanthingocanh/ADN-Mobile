import 'package:adnproject/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectImageRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.selectIdCardImage),
      ),
      body: Center(
        child: Column(
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



          ],
        ),
      ),
    );
  }
}
