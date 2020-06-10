import 'package:adnproject/constants/enums.dart';

class PersonInfo {
  String name;
  String cmnd;
  String cccd;
  DateTime birthDay;
  String permanentAddress;
  DateTime cardDate;
  String cardPlace;
  CardType cardType;

  PersonInfo({
    this.name,
    this.cmnd,
    this.cccd,
    this.birthDay,
    this.permanentAddress,
    this.cardDate,
    this.cardPlace,
    this.cardType,
  });
}
