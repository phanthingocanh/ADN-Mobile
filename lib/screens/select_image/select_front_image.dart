import 'package:adnproject/blocs/card_info/card_info_bloc.dart';
import 'package:adnproject/blocs/card_info/card_info_event.dart';
import 'package:adnproject/blocs/card_info/card_info_state.dart';
import 'package:adnproject/constants/strings.dart';
import 'package:adnproject/screens/select_image/select_back_image.dart';
import 'package:adnproject/screens/select_image/select_image_button.dart';
import 'package:adnproject/widgets/domestic_guest_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'card_type_dropdown.dart';

class SelectFrontImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CardInfoBloc>(
      create: (context) => CardInfoBloc(),
      child: _SelectFrontImageScreenContainer(),
    );
  }
}

class _SelectFrontImageScreenContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.8;
    final height = width * 0.75;
    return BlocBuilder<CardInfoBloc, CardInfoState>(
      builder: (BuildContext context, CardInfoState state) => Scaffold(
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
              CardTypeDropdown(
                height: 60.0,
                width: width,
              ),
              Flexible(
                child: Container(),
                flex: 1,
              ),
              Text(Strings.frontImage),
              SelectImageButton(
                height: height,
                width: width,
                imageSource: () {
                  return state.cardInfo.frontImage;
                },
                callback: (pickedImage) {
                  BlocProvider.of<CardInfoBloc>(context)
                      .add(UpdateFrontImageEvent(frontImage: pickedImage));
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
            child: Text(Strings.continues),
            onPressed: state.cardInfo.frontImage == null
                ? null
                : () => _selectBackImage(context, state),
          ),
        ),
      ),
    );
  }

  _selectBackImage(context, state) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SelectBackImageScreen(
          cardInfoState: state,
        ),
      ),
    );
  }
}
