// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_transaction_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateTransactionRequest _$UpdateTransactionRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateTransactionRequest(
      price: (json['price'] as num?)?.toInt(),
      purchasetype: json['purchasetype'] as String?,
      bags: (json['bags'] as num?)?.toInt(),
      customerid: (json['customerid'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toInt(),
      transactionid: (json['transactionid'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UpdateTransactionRequestToJson(
        UpdateTransactionRequest instance) =>
    <String, dynamic>{
      'transactionid': instance.transactionid,
      'bags': instance.bags,
      'customerid': instance.customerid,
      'price': instance.price,
      'purchasetype': instance.purchasetype,
      'weight': instance.weight,
    };
