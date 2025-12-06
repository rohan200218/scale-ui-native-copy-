import 'package:json_annotation/json_annotation.dart';

part 'delete_truck_response.g.dart';

@JsonSerializable(explicitToJson: true)
class DeleteTruckResponse {

  factory DeleteTruckResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteTruckResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteTruckResponseToJson(this);

  DeleteTruckResponse();
}
