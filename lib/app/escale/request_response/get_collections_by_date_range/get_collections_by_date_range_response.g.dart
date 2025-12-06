// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_collections_by_date_range_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCollectionsByDateRangeResponse _$GetCollectionsByDateRangeResponseFromJson(
        Map<String, dynamic> json) =>
    GetCollectionsByDateRangeResponse()
      ..customerName = json['customerName'] as String?
      ..totalCollected = (json['totalCollected'] as num?)?.toInt()
      ..collectedUsers = (json['collectedUsers'] as List<dynamic>?)
          ?.map((e) => CollectedUsers.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetCollectionsByDateRangeResponseToJson(
        GetCollectionsByDateRangeResponse instance) =>
    <String, dynamic>{
      'customerName': instance.customerName,
      'totalCollected': instance.totalCollected,
      'collectedUsers':
          instance.collectedUsers?.map((e) => e.toJson()).toList(),
    };
