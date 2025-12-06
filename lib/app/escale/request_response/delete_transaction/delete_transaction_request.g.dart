// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_transaction_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteTransactionRequest _$DeleteTransactionRequestFromJson(
        Map<String, dynamic> json) =>
    DeleteTransactionRequest(
      transactionid: (json['transactionid'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DeleteTransactionRequestToJson(
        DeleteTransactionRequest instance) =>
    <String, dynamic>{
      'transactionid': instance.transactionid,
    };
