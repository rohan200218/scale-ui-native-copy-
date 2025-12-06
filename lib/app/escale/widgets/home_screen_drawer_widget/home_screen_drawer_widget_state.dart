part of 'home_screen_drawer_widget_cubit.dart';

@freezed
class HomeScreenDrawerWidgetState with _$HomeScreenDrawerWidgetState {
  const factory HomeScreenDrawerWidgetState.initial({
    List<GetAllTrucksResponse>? getAllTrucksResponse,
    List<GetAllCustomersResponse>? getAllCustomersResponse,
    List<GetAllItemsResponse>? getAllItemsResponse
  }) = _Initial;
}
