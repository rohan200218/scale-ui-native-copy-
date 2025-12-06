// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_collections_by_month_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCollectionsByMonthRequest _$GetCollectionsByMonthRequestFromJson(
        Map<String, dynamic> json) =>
    GetCollectionsByMonthRequest(
      month: (json['month'] as num?)?.toInt(),
      year: (json['year'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetCollectionsByMonthRequestToJson(
        GetCollectionsByMonthRequest instance) =>
    <String, dynamic>{
      'year': instance.year,
      'month': instance.month,
    };
