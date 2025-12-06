part of 'get_collections_by_month_cubit.dart';

@freezed
class GetCollectionsByMonthState with _$GetCollectionsByMonthState {
  const factory GetCollectionsByMonthState.initial({
    int? month,
    int? year,
    String? selectedCollectedUser,
    List<GetCollectionsByMonthResponse>? getCollectionsByMonthResponse,
    @Default(BooleanStatus.initial) BooleanStatus getCollectionsByMonthStatus,
}) = _Initial;
}
