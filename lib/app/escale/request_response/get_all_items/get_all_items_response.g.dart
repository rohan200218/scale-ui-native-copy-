// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_items_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllItemsResponse _$GetAllItemsResponseFromJson(Map<String, dynamic> json) =>
    GetAllItemsResponse(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      price: json['price'] as String?,
    )
      ..createdAt = json['createdAt'] as String?
      ..updatedAt = json['updatedAt'] as String?
      ..shopId = (json['shopId'] as num?)?.toInt();

Map<String, dynamic> _$GetAllItemsResponseToJson(
        GetAllItemsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'shopId': instance.shopId,
    };
