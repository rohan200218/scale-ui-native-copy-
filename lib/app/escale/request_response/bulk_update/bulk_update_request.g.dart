// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bulk_update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BulkUpdateRequest _$BulkUpdateRequestFromJson(Map<String, dynamic> json) =>
    BulkUpdateRequest(
      truck: (json['truck'] as num?)?.toInt(),
      customer: (json['customer'] as num?)?.toInt(),
      price: json['price'] as String?,
    );

Map<String, dynamic> _$BulkUpdateRequestToJson(BulkUpdateRequest instance) =>
    <String, dynamic>{
      'customer': instance.customer,
      'truck': instance.truck,
      'price': instance.price,
    };
