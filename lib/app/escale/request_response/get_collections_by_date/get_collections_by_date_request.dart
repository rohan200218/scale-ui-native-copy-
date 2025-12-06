import 'package:json_annotation/json_annotation.dart';

part 'get_collections_by_date_request.g.dart';

@JsonSerializable(explicitToJson: true)
class GetCollectionsByDateRequest {
  String? date;

  factory GetCollectionsByDateRequest.fromJson(Map<String, dynamic> json) =>
      _$GetCollectionsByDateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetCollectionsByDateRequestToJson(this);

  GetCollectionsByDateRequest({this.date});
}
