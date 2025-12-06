// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_collections_by_month_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCollectionsByMonthResponse _$GetCollectionsByMonthResponseFromJson(
        Map<String, dynamic> json) =>
    GetCollectionsByMonthResponse()
      ..customerName = json['customerName'] as String?
      ..totalCollected = (json['totalCollected'] as num?)?.toInt()
      ..collectedUsers = (json['collectedUsers'] as List<dynamic>?)
          ?.map((e) => CollectedUsers.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetCollectionsByMonthResponseToJson(
        GetCollectionsByMonthResponse instance) =>
    <String, dynamic>{
      'customerName': instance.customerName,
      'totalCollected': instance.totalCollected,
      'collectedUsers':
          instance.collectedUsers?.map((e) => e.toJson()).toList(),
    };
