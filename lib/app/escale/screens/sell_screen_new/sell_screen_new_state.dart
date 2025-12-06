part of 'sell_screen_new_cubit.dart';

@freezed
class SellScreenNewState with _$SellScreenNewState {
  const factory SellScreenNewState.initial({
    GetRecentTransactionsState? getRecentTransactionsState,
    SellScreenTemplateState? sellScreenTemplateState,
    bool? loadingButton,
    List<GetAllTrucksResponse>? getAllTrucksResponse,
    @Default(BooleanStatus.initial) BooleanStatus getAllTrucksStatus,
    List<GetAllCustomersResponse>? getAllCustomersResponse,
    @Default(BooleanStatus.initial) BooleanStatus getAllCustomersStatus,
    List<GetAllItemsResponse>? getAllItemsResponse,
    BluetoothPrintConnectDeviceState? bluetoothState,
    @Default(BooleanStatus.initial) BooleanStatus printerConnectionStatus,
    @Default(false) bool lotSale
  }) = _Initial;
}
