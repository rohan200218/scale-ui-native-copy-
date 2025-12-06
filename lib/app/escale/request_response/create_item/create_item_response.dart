import 'package:json_annotation/json_annotation.dart';

part 'create_item_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateItemResponse {

  factory CreateItemResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateItemResponseToJson(this);

  CreateItemResponse();
}
