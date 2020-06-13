import 'package:adnproject/constants/enums.dart';
import 'package:flutter/foundation.dart';


class PersonInfo {
  String name;
  String cmnd;
  String cccd;
  DateTime birthDay;
  String permanentAddress;
  DateTime cardDate;
  String cardPlace;
  CardType cardType;
  String phone;
  String email;
  Gender gender;


  PersonInfo({
    this.name,
    this.cmnd,
    this.cccd,
    this.birthDay,
    this.permanentAddress,
    this.cardDate,
    this.cardPlace,
    this.cardType,
    this.email,
    this.phone,
    this.gender,
  });

//  String get personName{
//    return name;
//  }
//
//  void set personName (String nameval){
//    name=nameval;
//
//  }
}
