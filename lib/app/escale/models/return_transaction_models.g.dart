// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_transaction_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReturnTransactions _$ReturnTransactionsFromJson(Map<String, dynamic> json) =>
    ReturnTransactions(
      id: (json['id'] as num?)?.toInt(),
      customerId: (json['customerId'] as num?)?.toInt(),
      customerName: json['customerName'] as String?,
      returnType: json['returnType'] as String?,
      amountReturned: (json['amountReturned'] as num?)?.toInt(),
      receipt: json['receipt'] as String?,
      date: json['date'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$ReturnTransactionsToJson(ReturnTransactions instance) =>
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
