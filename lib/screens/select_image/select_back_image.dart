import 'package:adnproject/constants/strings.dart';
import 'package:adnproject/models/card_info.dart';
import 'package:adnproject/screens/select_image/select_front_image.dart';
import 'package:adnproject/screens/select_image/select_image_button.dart';
import 'package:adnproject/widgets/domestic_guest_banner.dart';
import 'package:flutter/material.dart';

class SelectBackImageScreen extends StatefulWidget {
  final CardInfo cardInfo;

  const SelectBackImageScreen({Key key, this.cardInfo}) : super(key: key);

  @override
  State createState() => new _SelectBackImageScreenState();
}

class _SelectBackImageScreenState extends State<SelectBackImageScreen> {
  final _backKey = new GlobalKey<SelectImageState>();

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
                disabledHint: cardTypeMap[widget.cardInfo.cardType],
                value: widget.cardInfo.cardType,
                items: [],
                onChanged: null,
              ),
            ),
            Flexible(
              child: Container(),
              flex: 1,
            ),
            Text('Mặt sau'),
            SelectImageButton(
              key: _backKey,
              height: height,
              width: width,
              initialImage: widget.cardInfo.backImage,
              onDone: () {
                setState(() {
                  widget.cardInfo.backImage = _backKey.currentState.imageFile;
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
          onPressed: () => _sendData(),
        ),
      ),
    );
  }

  _sendData() {
    debugPrint('${widget.cardInfo.cardType}');
    debugPrint('frontImage = ${widget.cardInfo.frontImage}');
    debugPrint('backImage = ${widget.cardInfo.backImage}');
  }
}
