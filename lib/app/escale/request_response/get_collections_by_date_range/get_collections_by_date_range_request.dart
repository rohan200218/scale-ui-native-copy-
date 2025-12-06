import 'package:json_annotation/json_annotation.dart';

part 'get_collections_by_date_range_request.g.dart';

@JsonSerializable(explicitToJson: true)
class GetCollectionsByDateRangeRequest {
  String? startDate;
  String? endDate;

  factory GetCollectionsByDateRangeRequest.fromJson(
      Map<String, dynamic> json) =>
      _$GetCollectionsByDateRangeRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetCollectionsByDateRangeRequestToJson(this);

  GetCollectionsByDateRangeRequest({this.startDate, this.endDate});
}
