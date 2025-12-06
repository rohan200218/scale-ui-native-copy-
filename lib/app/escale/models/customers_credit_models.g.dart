// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customers_credit_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerCreditReport _$CustomerCreditReportFromJson(
        Map<String, dynamic> json) =>
    CustomerCreditReport(
      customerId: (json['customerId'] as num?)?.toInt(),
      customerName: json['customerName'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CustomerCreditReportToJson(
        CustomerCreditReport instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'items': instance.items,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      item: json['item'] as String?,
      price: (json['price'] as num?)?.toInt(),
      totalBags: (json['totalBags'] as num?)?.toInt(),
      totalWeight: (json['totalWeight'] as num?)?.toInt(),
      totalCredit: (json['totalCredit'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'item': instance.item,
      'price': instance.price,
      'totalBags': instance.totalBags,
      'totalWeight': instance.totalWeight,
      'totalCredit': instance.totalCredit,
      'createdAt': instance.createdAt,
    };
