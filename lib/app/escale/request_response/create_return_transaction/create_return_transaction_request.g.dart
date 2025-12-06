// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_return_transaction_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateReturnTransactionRequest _$CreateReturnTransactionRequestFromJson(
        Map<String, dynamic> json) =>
    CreateReturnTransactionRequest(
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      returnType: json['returnType'] as String?,
      customerId: (json['customerId'] as num?)?.toInt(),
      amountReturned: (json['amountReturned'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CreateReturnTransactionRequestToJson(
        CreateReturnTransactionRequest instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'amountReturned': instance.amountReturned,
      'returnType': instance.returnType,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
