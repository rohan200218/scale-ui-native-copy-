import 'package:json_annotation/json_annotation.dart';

part 'create_truck_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateTruckResponse {

  factory CreateTruckResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateTruckResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateTruckResponseToJson(this);

  CreateTruckResponse();
}
