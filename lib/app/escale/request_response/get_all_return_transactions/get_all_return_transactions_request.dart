import 'package:json_annotation/json_annotation.dart';

part 'get_all_return_transactions_request.g.dart';

@JsonSerializable(explicitToJson: true)
class GetAllReturnTransactionsRequest {

  factory GetAllReturnTransactionsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetAllReturnTransactionsRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetAllReturnTransactionsRequestToJson(this);

  GetAllReturnTransactionsRequest();
}
