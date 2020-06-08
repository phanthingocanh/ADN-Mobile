import 'package:adnproject/blocs/card_info/card_info_bloc.dart';
import 'package:adnproject/blocs/card_info/card_info_event.dart';
import 'package:adnproject/blocs/card_info/card_info_state.dart';
import 'package:adnproject/constants/enums.dart';
import 'package:adnproject/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final Map<CardType, Widget> cardTypeMap = <CardType, Widget>{
  CardType.cmnd: Text(Strings.cmnd),
  CardType.cccd: Text(Strings.cccd),
};

final _fieldDecoration = InputDecoration(
  labelText: Strings.cardType,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30.0),
  ),
);

class CardTypeDropdown extends StatelessWidget {
  final height;
  final width;

  CardTypeDropdown({this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardInfoBloc, CardInfoState>(
      condition: (previous, current) =>
          previous.cardInfo.cardType != current.cardInfo.cardType,
      builder: (BuildContext context, CardInfoState state) => Container(
        height: this.height,
        width: this.width,
        child: DropdownButtonFormField(
          decoration: _fieldDecoration,
          isExpanded: true,
          value: state.cardInfo.cardType,
          items: cardTypeMap.entries.map((entry) {
            return DropdownMenuItem(
              child: entry.value,
              value: entry.key,
            );
          }).toList(),
          onChanged: (value) {
            BlocProvider.of<CardInfoBloc>(context).add(
              UpdateCardTypeEvent(cardType: value),
            );
          },
        ),
      ),
    );
  }
}

class CardTypeDropdownDisabled extends StatelessWidget {
  final height;
  final width;

  CardTypeDropdownDisabled({this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardInfoBloc, CardInfoState>(
      condition: (previous, current) =>
          previous.cardInfo.cardType != current.cardInfo.cardType,
      builder: (BuildContext context, CardInfoState state) => Container(
        height: this.height,
        width: this.width,
        child: DropdownButtonFormField(
          decoration: _fieldDecoration,
          isExpanded: true,
          disabledHint: cardTypeMap[state.cardInfo.cardType],
          value: state.cardInfo.cardType,
          items: [],
          onChanged: null,
        ),
      ),
    );
  }
}
