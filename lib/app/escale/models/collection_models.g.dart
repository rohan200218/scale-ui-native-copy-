// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionModels _$CollectionModelsFromJson(Map<String, dynamic> json) =>
    CollectionModels(
      customerName: json['customerName'] as String?,
      totalCollected: (json['totalCollected'] as num?)?.toInt(),
      collectedUsers: (json['collectedUsers'] as List<dynamic>?)
          ?.map((e) => CollectedUsers.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CollectionModelsToJson(CollectionModels instance) =>
    <String, dynamic>{
      'customerName': instance.customerName,
      'totalCollected': instance.totalCollected,
      'collectedUsers': instance.collectedUsers,
    };

CollectedUsers _$CollectedUsersFromJson(Map<String, dynamic> json) =>
    CollectedUsers(
      collectedUser: json['collectedUser'] as String?,
      totalCollected: (json['totalCollected'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CollectedUsersToJson(CollectedUsers instance) =>
    <String, dynamic>{
      'collectedUser': instance.collectedUser,
      'totalCollected': instance.totalCollected,
    };
