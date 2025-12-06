part of 'get_collections_by_date_range_cubit.dart';

@freezed
class GetCollectionsByDateRangeState with _$GetCollectionsByDateRangeState {
  const factory GetCollectionsByDateRangeState.initial({
    String? startDate,
    String? endDate,
    List<GetCollectionsByDateRangeResponse>? getCollectionsByDateRangeResponse,
    @Default(BooleanStatus.initial) BooleanStatus getCollectionsByDateRangeStatus,
    String? selectedCollectedUser
}) = _Initial;
}
