// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_return_transactions_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllReturnTransactionsResponse _$GetAllReturnTransactionsResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllReturnTransactionsResponse()
      ..id = (json['id'] as num?)?.toInt()
      ..customerId = (json['customerId'] as num?)?.toInt()
      ..customerName = json['customerName'] as String?
      ..returnType = json['returnType'] as String?
      ..amountReturned = (json['amountReturned'] as num?)?.toInt()
      ..receipt = json['receipt'] as String?
      ..date = json['date'] as String?
      ..location = json['location'] as String?;

Map<String, dynamic> _$GetAllReturnTransactionsResponseToJson(
        GetAllReturnTransactionsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'returnType': instance.returnType,
      'amountReturned': instance.amountReturned,
      'receipt': instance.receipt,
      'date': instance.date,
      'location': instance.location,
    };
