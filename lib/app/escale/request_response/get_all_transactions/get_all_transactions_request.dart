import 'package:json_annotation/json_annotation.dart';

part 'get_all_transactions_request.g.dart';

@JsonSerializable(explicitToJson: true)
class GetAllTransactionsRequest {
  int? customerid;
  int? truckid;
  String? date;

  factory GetAllTransactionsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetAllTransactionsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllTransactionsRequestToJson(this);

  GetAllTransactionsRequest({this.truckid, this.customerid, this.date});
}
