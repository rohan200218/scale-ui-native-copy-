// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_customer_credit_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCustomerCreditRequest _$UpdateCustomerCreditRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateCustomerCreditRequest(
      customerId: (json['customerId'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toInt(),
      newTotalCredit: (json['newTotalCredit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UpdateCustomerCreditRequestToJson(
        UpdateCustomerCreditRequest instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'price': instance.price,
      'newTotalCredit': instance.newTotalCredit,
    };
