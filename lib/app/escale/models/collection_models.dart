import 'package:freezed_annotation/freezed_annotation.dart';

part 'collection_models.g.dart';

@JsonSerializable()
class CollectionModels {
  String? customerName;
  int? totalCollected;
  List<CollectedUsers>? collectedUsers;

  CollectionModels(
      {this.customerName, this.totalCollected, this.collectedUsers});

    factory CollectionModels.fromJson(Map<String, dynamic> json) =>
          _$CollectionModelsFromJson(json);

      Map<String, dynamic> toJson() => _$CollectionModelsToJson(this);

}

@JsonSerializable()
class CollectedUsers {
  String? collectedUser;
  int? totalCollected;

  CollectedUsers({this.collectedUser, this.totalCollected});

    factory CollectedUsers.fromJson(Map<String, dynamic> json) =>
          _$CollectedUsersFromJson(json);

      Map<String, dynamic> toJson() => _$CollectedUsersToJson(this);

}
