import 'package:basic/app/escale/models/collection_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_collections_by_date_range_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetCollectionsByDateRangeResponse extends CollectionModels{

  factory GetCollectionsByDateRangeResponse.fromJson(
      Map<String, dynamic> json) =>
      _$GetCollectionsByDateRangeResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetCollectionsByDateRangeResponseToJson(this);

  GetCollectionsByDateRangeResponse();
}
