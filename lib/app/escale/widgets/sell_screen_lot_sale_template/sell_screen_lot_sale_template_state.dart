part of 'sell_screen_lot_sale_template_cubit.dart';

@freezed
class SellScreenLotSaleTemplateState with _$SellScreenLotSaleTemplateState {
  const factory SellScreenLotSaleTemplateState.initial({
    Trucks? selectedTruck,
    String? selectedItem,
    Customers? selectedCustomer,
    String? purchaseType,
    int? lotSize,
    double? constPrice,
    double? itemWeight,
    bool? loadingButton,
    bool? formValid,
    CreateTransactionResponse? createTransactionResponse,
    @Default(BooleanStatus.initial) BooleanStatus createTransactionStatus,
    BluetoothState? bluetoothState,
    BluetoothPrintPrintReceiptState? bluetoothPrintPrintReceiptState,
    @Default(BooleanStatus.initial) BooleanStatus printerConnectionStatus,
    GetTransactionsByCustomerIdState? getTransactionsByCustomerIdState,
    List<GetTransactionsByCustomerIdResponse>? getTransactionsByCustomerIdResponse
  }) = _Initial;
}
