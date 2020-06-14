import 'dart:convert';

import 'package:adnproject/models/card_info.dart';
import 'package:adnproject/models/declaration.dart';
import 'package:adnproject/models/person_info.dart';
import 'package:adnproject/constants/enums.dart';
import 'package:http/http.dart' as http;

class ClientApiService {
  ClientApiService._();

  static ClientApiService _instance;

  static ClientApiService get instance => _instance ?? ClientApiService._();

  Future<PersonInfo> getPersonInfo(CardInfo cardInfo) async {
    await new Future.delayed(const Duration(seconds: 3));
    return PersonInfo(
      birthDay: DateTime.utc(1998, 1, 1),
      cardDate: DateTime.utc(2014, 1, 1),
      cardPlace: 'HCM',
      cmnd: '123123123',
      name: 'Aaa Bbb Ccc',
      permanentAddress: '123 Abc, Xyz',
      phone: '099-999-999',
      email: 'aa@gmail.com',
      gender: Gender.male,
      cardType: CardType.cmnd,
    );
  }

  Future<String> postPersonDeclare(
      PersonInfo person, Declaration declare) async {
    String json1 = jsonEncode(person);
    String json2 = jsonEncode(declare);
    String bodyPass = {'userRequest':json1,'declarationRequest': json2}.toString();
    print(bodyPass);
    var res = await http.post(
        Uri.encodeFull("http://10.0.2.2:8080/user-declarations"),
        headers: {"Accept": "application/hal+json"},
        body: {
          'userRequest': json1,
          'declarationRequest': json2,
        },
    );
    print(json2);
    if (res.statusCode == 200){
      print("Body " +res.body);
      return "Success";
    }
    else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to post user-declare');
    }
  }

  
  Future<String> getData() async {
    await http.get(Uri.encodeFull("http://10.0.2.2:8080/users"),
        headers: {"Accept": "application/hal+json", "id": "string"});
  }
}
