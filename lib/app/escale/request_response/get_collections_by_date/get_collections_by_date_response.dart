import 'package:basic/app/escale/models/collection_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_collections_by_date_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetCollectionsByDateResponse extends CollectionModels{

  factory GetCollectionsByDateResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCollectionsByDateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCollectionsByDateResponseToJson(this);

  GetCollectionsByDateResponse();
}
