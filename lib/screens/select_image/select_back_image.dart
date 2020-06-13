import 'package:adnproject/blocs/card_info/card_info_bloc.dart';
import 'package:adnproject/blocs/card_info/card_info_event.dart';
import 'package:adnproject/blocs/card_info/card_info_state.dart';
import 'package:adnproject/constants/strings.dart';
import 'package:adnproject/models/person_info.dart';
import 'package:adnproject/screens/select_image/select_image_button.dart';
import 'package:adnproject/services/client_api_service.dart';
import 'package:adnproject/widgets/domestic_guest_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'card_type_dropdown.dart';

class SelectBackImageScreen extends StatelessWidget {
  final CardInfoState cardInfoState;

  const SelectBackImageScreen({Key key, this.cardInfoState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CardInfoBloc>(
      create: (context) => CardInfoBloc(fromState: this.cardInfoState),
      child: _SelectBackImageScreenContainer(),
    );
  }
}

class _SelectBackImageScreenContainer extends StatelessWidget {
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
              CardTypeDropdownDisabled(
                height: 60.0,
                width: width,
              ),
              Flexible(
                child: Container(),
                flex: 1,
              ),
              Text(Strings.backImage),
              SelectImageButton(
                height: height,
                width: width,
                imageSource: () {
                  return state.cardInfo.backImage;
                },
                callback: (pickedImage) {
                  BlocProvider.of<CardInfoBloc>(context)
                      .add(UpdateBackImageEvent(backImage: pickedImage));
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
          child: _nextButton(context, state),
        ),
      ),
    );
  }

  Widget _nextButton(BuildContext context, CardInfoState state) {
    if (state.isSending) {
      return RaisedButton(
        child: CircularProgressIndicator(strokeWidth: 3),
        onPressed: null,
      );
    } else if (state.cardInfo.backImage == null) {
      return RaisedButton(
        child: Text(Strings.continues),
        onPressed: null,
      );
    } else {
      return RaisedButton(
        child: Text(Strings.continues),
        onPressed: () async => _process(context, state),
      );
    }
  }

  _process(BuildContext context, CardInfoState state) async {
    BlocProvider.of<CardInfoBloc>(context).add(SendCardInfoEvent());
    PersonInfo personInfo =  await ClientApiService.instance.getPersonInfo(state.cardInfo);
    return Navigator.of(context).pushNamedAndRemoveUntil(
      RouteStrings.fillForm,
      ModalRoute.withName(RouteStrings.selectMethod),
      arguments: personInfo,
    );
  }
}
