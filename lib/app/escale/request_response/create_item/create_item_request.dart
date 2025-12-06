import 'package:json_annotation/json_annotation.dart';

part 'create_item_request.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateItemRequest {

  factory CreateItemRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateItemRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateItemRequestToJson(this);

  CreateItemRequest();
}
