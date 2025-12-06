import 'package:json_annotation/json_annotation.dart';

part 'bulk_update_response.g.dart';

@JsonSerializable(explicitToJson: true)
class BulkUpdateResponse {

  factory BulkUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$BulkUpdateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BulkUpdateResponseToJson(this);

  BulkUpdateResponse();
}
