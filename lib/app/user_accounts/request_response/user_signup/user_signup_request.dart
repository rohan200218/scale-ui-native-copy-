import 'package:json_annotation/json_annotation.dart';

part 'user_signup_request.g.dart';

@JsonSerializable(explicitToJson: true)
class UserSignupRequest {
  String? username;
  String? email;
  String? password;

  factory UserSignupRequest.fromJson(Map<String, dynamic> json) =>
      _$UserSignupRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserSignupRequestToJson(this);

  UserSignupRequest({this.email, this.username, this.password});
}
