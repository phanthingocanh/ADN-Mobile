import 'package:adnproject/models/card_info.dart';
import 'package:adnproject/models/person_info.dart';

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
    );
  }
}
