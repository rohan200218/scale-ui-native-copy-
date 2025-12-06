// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_collections_by_date_range_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCollectionsByDateRangeRequest _$GetCollectionsByDateRangeRequestFromJson(
        Map<String, dynamic> json) =>
    GetCollectionsByDateRangeRequest(
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
    );

Map<String, dynamic> _$GetCollectionsByDateRangeRequestToJson(
        GetCollectionsByDateRangeRequest instance) =>
    <String, dynamic>{
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };
