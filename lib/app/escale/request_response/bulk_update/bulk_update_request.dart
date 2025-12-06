import 'package:json_annotation/json_annotation.dart';

part 'bulk_update_request.g.dart';

@JsonSerializable(explicitToJson: true)
class BulkUpdateRequest {
  int? customer;
  int? truck;
  String? price;

  factory BulkUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$BulkUpdateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BulkUpdateRequestToJson(this);

  BulkUpdateRequest({this.truck, this.customer, this.price});
}
