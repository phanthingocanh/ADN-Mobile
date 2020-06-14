import 'package:adnproject/models/declaration.dart';
import 'package:adnproject/models/person_info.dart';

class UserDeclare {
  PersonInfo userRequest;
  Declaration declarationRequest;
  UserDeclare({
    this.declarationRequest,
    this.userRequest,
  });
  Map<String, dynamic> toJson() => {
        'userRequest': userRequest,
        'declarationRequest':declarationRequest,
  };
  factory UserDeclare.fromJson(Map<String, dynamic> json) {
    return UserDeclare(
      userRequest: json['userRequest'],
      declarationRequest: json['declarationRequest'],
    );
  }
}
