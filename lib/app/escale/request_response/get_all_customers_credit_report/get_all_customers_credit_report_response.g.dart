// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_customers_credit_report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllCustomersCreditReportResponse
    _$GetAllCustomersCreditReportResponseFromJson(Map<String, dynamic> json) =>
        GetAllCustomersCreditReportResponse()
          ..customerId = (json['customerId'] as num?)?.toInt()
          ..customerName = json['customerName'] as String?
          ..items = (json['items'] as List<dynamic>?)
              ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
              .toList();

Map<String, dynamic> _$GetAllCustomersCreditReportResponseToJson(
        GetAllCustomersCreditReportResponse instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'items': instance.items?.map((e) => e.toJson()).toList(),
    };
