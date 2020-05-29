import 'package:adnproject/constants/enums.dart';
import 'package:adnproject/constants/strings.dart';
import 'package:adnproject/models/card_info.dart';
import 'package:adnproject/screens/select_image/select_back_image.dart';
import 'package:adnproject/screens/select_image/select_image_button.dart';
import 'package:adnproject/widgets/domestic_guest_banner.dart';
import 'package:flutter/material.dart';

final Map<CardType, Widget> cardTypeMap = <CardType, Widget>{
  CardType.cmnd: Text('Chứng minh thư nhân dân'),
  CardType.cccd: Text('Căn cước công dân'),
  CardType.passport: Text('Hộ chiếu'),
};

class SelectFrontImageScreen extends StatefulWidget {
  const SelectFrontImageScreen({Key key, this.cardInfo}) : super(key: key);
  final CardInfo cardInfo;

  @override
  State createState() => new SelectFrontImageScreenState();
}

class SelectFrontImageScreenState extends State<SelectFrontImageScreen> {
  final _frontKey = new GlobalKey<SelectImageState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.8;
    final height = width * 0.75;
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.selectIdCardImage),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            DomesticGuestBanner(),
            Flexible(
              child: Container(),
              flex: 2,
            ),
            Container(
              height: 60.0,
              width: width,
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: 'Loại giấy tờ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                isExpanded: true,
                value: widget.cardInfo.cardType,
                items: cardTypeMap.entries
                    .map((entry) => DropdownMenuItem(
                          child: entry.value,
                          value: entry.key,
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    widget.cardInfo.cardType = value;
                  });
                },
              ),
            ),
            Flexible(
              child: Container(),
              flex: 1,
            ),
            Text('Mặt trước'),
            SelectImageButton(
              key: _frontKey,
              height: height,
              width: width,
              initialImage: widget.cardInfo.frontImage,
              onDone: () {
                setState(() {
                  widget.cardInfo.frontImage = _frontKey.currentState.imageFile;
                });
              },
            ),
            Flexible(
              child: Container(),
              flex: 2,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10.0),
        width: double.infinity,
        child: RaisedButton(
          child: Text('Tiếp tục'),
          onPressed: widget.cardInfo.frontImage == null ? null : _selectBack(),
        ),
      ),
    );
  }

  _selectBack() {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectBackImageScreen(
          cardInfo: widget.cardInfo,
        ),
      ),
    );
  }
}
