import 'dart:async';

import 'package:adnproject/blocs/card_info/card_info_event.dart';
import 'package:adnproject/blocs/card_info/card_info_state.dart';
import 'package:adnproject/models/card_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardInfoBloc extends Bloc<CardInfoEvent, CardInfoState> {
  final CardInfoState fromState;

  CardInfoBloc({this.fromState});

  @override
  CardInfoState get initialState =>
      this.fromState ?? CardInfoState(cardInfo: CardInfo());

  @override
  Stream<CardInfoState> mapEventToState(CardInfoEvent event) async* {
    if (event is SendCardInfoEvent) {
      yield state.copyWith(isSending: true);
    } else if (event is UpdateCardTypeEvent) {
      yield state.copyWith(cardType: event.cardType);
    } else if (event is UpdateFrontImageEvent) {
      yield state.copyWith(frontImage: event.frontImage);
    } else if (event is UpdateBackImageEvent) {
      yield state.copyWith(backImage: event.backImage);
    }
  }
}
