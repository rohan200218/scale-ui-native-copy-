import 'package:basic/app/escale/models/collection_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_collections_by_month_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetCollectionsByMonthResponse extends CollectionModels{

  factory GetCollectionsByMonthResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCollectionsByMonthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCollectionsByMonthResponseToJson(this);

  GetCollectionsByMonthResponse();
}
