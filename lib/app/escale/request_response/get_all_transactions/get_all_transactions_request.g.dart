// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_transactions_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllTransactionsRequest _$GetAllTransactionsRequestFromJson(
        Map<String, dynamic> json) =>
    GetAllTransactionsRequest(
      truckid: (json['truckid'] as num?)?.toInt(),
      customerid: (json['customerid'] as num?)?.toInt(),
      date: json['date'] as String?,
    );

Map<String, dynamic> _$GetAllTransactionsRequestToJson(
        GetAllTransactionsRequest instance) =>
    <String, dynamic>{
      'customerid': instance.customerid,
      'truckid': instance.truckid,
      'date': instance.date,
    };
