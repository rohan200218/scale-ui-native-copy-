import 'package:basic/app/user_accounts/models/users/user_account.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_signup_response.g.dart';

@JsonSerializable(explicitToJson: true)
class UserSignupResponse extends UserAccount{

  factory UserSignupResponse.fromJson(Map<String, dynamic> json) =>
      _$UserSignupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserSignupResponseToJson(this);

  UserSignupResponse();
}
