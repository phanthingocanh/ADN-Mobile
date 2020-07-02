import 'dart:convert';
import 'dart:io';

import 'package:adnproject/constants/enums.dart';
import 'package:adnproject/constants/strings.dart';
import 'package:adnproject/models/card_info.dart';
import 'package:adnproject/models/card_info_request.dart';
import 'package:adnproject/models/declaration.dart';
import 'package:adnproject/models/person_info.dart';
import 'package:adnproject/models/user_declare.dart';
import 'package:http/http.dart' as http;

import 'ml_kit_ocr.dart';

class ClientApiService {
  ClientApiService._();

  static ClientApiService _instance;

  static ClientApiService get instance => _instance ?? ClientApiService._();

  Future<PersonInfo> getPersonInfo(CardInfo cardInfo) async {
    return analyzeImage(cardInfo.frontImage, cardInfo.backImage);
//    return analyzeImageCloud(
//      cardInfo.cardType,
//      cardInfo.frontImage,
//      cardInfo.backImage,
//    );
  }

  Future<PersonInfo> analyzeImageCloud(
      CardType cardType, File frontImage, File backImage) async {
    try {
      List<int> frontImageBytes = frontImage.readAsBytesSync();
      String frontImageBase64 = base64Encode(frontImageBytes);
      List<int> backImageBytes = backImage.readAsBytesSync();
      String backImageBase64 = base64Encode(backImageBytes);
      Map<String, String> params = {'service': 'GOOGLE'};
      CardInfoRequest bodyPass = new CardInfoRequest(
        cardType: cardType,
        frontImageBase64: frontImageBase64,
        backImageBase64: backImageBase64,
      );
      var jsonEncoded = jsonEncode(bodyPass);
      var response = await http.post(
        Uri.http(Strings.serverPath, 'ocr', params),
        headers: {"content-type": "application/hal+json; charset=utf-8"},
        body: jsonEncoded,
      );
      String source = Utf8Decoder().convert(response.bodyBytes);
      PersonInfo personInfo = parsePersonInfo(source);
      print(source);
      print(personInfo.cmnd);
      return personInfo;
    } catch (e) {
      return new PersonInfo();
    }
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
      Uri.http(Strings.serverPath, "/user-declarations"),
//        Uri.encodeFull("http://10.0.2.2:8080/user-declarations"),
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
    var response = await http.get(
      Uri.http(Strings.serverPath, "/user-declarations/$id"),
      headers: {"content-type": "application/hal+json; charset = utf-8"
      },
    );

    String source = Utf8Decoder().convert(response.bodyBytes);
    
//    data = json.decode(response.body);
    if (response.statusCode == 200) {
      print("source");
      print(source);
      // print(response.body);
      return parsePersonInfo(source);
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
    var response = await http.get(
      Uri.http(Strings.serverPath, "/user-declarations/$id"),
      headers: {"Accept": "application/hal+json"},
    );

    String source = Utf8Decoder().convert(response.bodyBytes);
//    data = json.decode(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      print("source");
      print(source);
      return parseDeclaration(source);
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
