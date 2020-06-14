import 'dart:convert';

import 'package:adnproject/models/card_info.dart';
import 'package:adnproject/models/declaration.dart';
import 'package:adnproject/models/person_info.dart';
import 'package:adnproject/constants/enums.dart';
import 'package:adnproject/models/user_declare.dart';
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
    UserDeclare bodyPass = new UserDeclare(
      userRequest: person,
      declarationRequest: declare,
    );
    String body = jsonEncode(bodyPass);
    print(bodyPass);
    // String transformedText = bodyPass.replaceAll('""', '"');
    var res = await http.post(
        Uri.encodeFull("http://10.0.2.2:8080/user-declarations"),    
        headers: {"Content-Type": "application/json"},
        body: body,
    );
    print(body);
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

  
  // Future<String> getData() async {
  //   await http.get(Uri.encodeFull("http://10.0.2.2:8080/users"),
  //       headers: {"Accept": "application/hal+json", "id": "string"});
  // }

  Future<PersonInfo> getPersonInfoById(String id) async {
    Map<String, String> qParams = {
      'id': id,
    };
    
    var response = await http.get(
      Uri.http("10.0.2.2:8080", "/user-declarations", qParams),
      headers: {"Accept": "application/hal+json"},
    );
//    data = json.decode(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      return parsePersonInfo(response.body);
    } 
    if (response.statusCode == 404) {
      print(response.body);
      return null;
    } 
    else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to load user-declare');
    }
  }

  Future<Declaration> getDeclaration(String id) async {
    await new Future.delayed(const Duration(seconds: 1));
    Map<String, String> qParams = {
      'id': id,
    };
    
    var response = await http.get(
      Uri.http("10.0.2.2:8080", "/user-declarations", qParams),
      headers: {"Accept": "application/hal+json"},
    );
//    data = json.decode(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      return parseDeclaration(response.body);
    } 
    if (response.statusCode == 404) {
      print(response.body);
      return null;
    } 
    else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to load user-declare');
    }
  }
  

  PersonInfo parsePersonInfo(String responseBody) {    
    // final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    // return parsed.map<PersonInfo>((json) => PersonInfo.fromJson(json)).toList();
    var json=jsonDecode(responseBody);

    return PersonInfo.fromJson(json);
  }

  Declaration parseDeclaration(String responseBody) {
    var json=jsonDecode(responseBody);
    return Declaration.fromJson(json);
  }

}
