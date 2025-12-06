import 'package:json_annotation/json_annotation.dart';

part 'get_all_trucks_request.g.dart';

@JsonSerializable(explicitToJson: true)
class GetAllTrucksRequest {

  factory GetAllTrucksRequest.fromJson(Map<String, dynamic> json) =>
      _$GetAllTrucksRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllTrucksRequestToJson(this);

  GetAllTrucksRequest();
}
