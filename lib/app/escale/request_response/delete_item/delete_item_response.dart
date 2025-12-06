import 'package:json_annotation/json_annotation.dart';

part 'delete_item_response.g.dart';

@JsonSerializable(explicitToJson: true)
class DeleteItemResponse {

  factory DeleteItemResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteItemResponseToJson(this);

  DeleteItemResponse();
}
