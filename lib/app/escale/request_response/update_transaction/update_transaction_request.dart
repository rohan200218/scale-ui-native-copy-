import 'package:json_annotation/json_annotation.dart';

part 'update_transaction_request.g.dart';

@JsonSerializable(explicitToJson: true)
class UpdateTransactionRequest {
  int? transactionid;
  int? bags;
  int? customerid;
  int? price;
  String? purchasetype;
  int? weight;

  factory UpdateTransactionRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateTransactionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateTransactionRequestToJson(this);

  UpdateTransactionRequest({this.price, this.purchasetype, this.bags, this.customerid, this.weight, this.transactionid});
}
