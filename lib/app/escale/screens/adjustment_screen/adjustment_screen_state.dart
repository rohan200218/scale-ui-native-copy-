part of 'adjustment_screen_cubit.dart';

@freezed
class AdjustmentScreenState with _$AdjustmentScreenState {
  const factory AdjustmentScreenState.initial({
    List<GetAllTrucksResponse>? getAllTrucksResponse,
    List<GetAllCustomersResponse>? getAllCustomersResponse,
    Customers? selectedCustomer,
    Trucks? selectedTruck,
    bool? loadingButton,
    GetTransactionsByDateTruckCustomerState? getTransactionsByDateTruckCustomerState,
    BulkUpdateCashState? bulkUpdateCashState,
    BulkUpdateCreditState? bulkUpdateCreditState
}) = _Initial;
}
