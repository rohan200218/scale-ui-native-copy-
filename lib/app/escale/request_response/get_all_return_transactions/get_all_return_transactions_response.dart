import 'package:basic/app/escale/models/return_transaction_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_return_transactions_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetAllReturnTransactionsResponse extends ReturnTransactions{

  factory GetAllReturnTransactionsResponse.fromJson(
      Map<String, dynamic> json) =>
      _$GetAllReturnTransactionsResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetAllReturnTransactionsResponseToJson(this);

  GetAllReturnTransactionsResponse();
}
