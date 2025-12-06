// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_signup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSignupResponse _$UserSignupResponseFromJson(Map<String, dynamic> json) =>
    UserSignupResponse()
      ..id = (json['id'] as num?)?.toInt()
      ..username = json['username'] as String?
      ..email = json['email'] as String?
      ..roles =
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..accessToken = json['accessToken'] as String?
      ..refreshToken = json['refreshToken'] as String?
      ..shops = (json['shops'] as List<dynamic>?)
          ?.map((e) => Shops.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$UserSignupResponseToJson(UserSignupResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'roles': instance.roles,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'shops': instance.shops?.map((e) => e.toJson()).toList(),
    };
