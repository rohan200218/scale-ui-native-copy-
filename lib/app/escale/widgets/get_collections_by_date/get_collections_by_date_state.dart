part of 'get_collections_by_date_cubit.dart';

@freezed
class GetCollectionsByDateState with _$GetCollectionsByDateState {
  const factory GetCollectionsByDateState.initial({
    String? date,
    List<GetCollectionsByDateResponse>? getCollectionsByDateResponse,
    @Default(BooleanStatus.initial) BooleanStatus getCollectionsByDateStatus,
    String? selectedCollectedUser
}) = _Initial;
}
