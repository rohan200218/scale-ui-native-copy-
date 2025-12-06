import 'package:json_annotation/json_annotation.dart';

part 'get_collections_by_month_request.g.dart';

@JsonSerializable(explicitToJson: true)
class GetCollectionsByMonthRequest {
  int? year;
  int? month;

  factory GetCollectionsByMonthRequest.fromJson(Map<String, dynamic> json) =>
      _$GetCollectionsByMonthRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetCollectionsByMonthRequestToJson(this);

  GetCollectionsByMonthRequest({this.month, this.year});
}
