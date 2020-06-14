import 'package:adnproject/constants/enums.dart';
// import 'package:flutter/foundation.dart';

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
  Map<String, dynamic> toJson() => {
        'name': name,
        'idCardNumber': cmnd,
        'birthDay': birthDay.toString(),
        'permanentAddress': permanentAddress,
        'cardDate': cardDate.toString(),
        'cardPlace': cardPlace,
        'email': email,
        'phone': phone,
  };
  factory PersonInfo.fromJson(Map<String, dynamic> json) {
    return PersonInfo(
      name: json['name'],
      cmnd: json['idCardNumber'],
      // cccd: json['idCardNumber'],
      birthDay: json['birthDay'],
      permanentAddress: json['permanentAddress'],
      cardDate: json['cardDate'],
      cardPlace: json['cardPlace'],
      email: json['email'],
      phone: json['phone'],
    );
  }
  

//  String get personName{
//    return name;
//  }
//
//  void set personName (String nameval){
//    name=nameval;
//
//  }
}
