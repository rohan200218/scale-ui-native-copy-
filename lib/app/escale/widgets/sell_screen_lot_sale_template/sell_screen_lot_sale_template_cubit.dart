import 'package:basic/app/escale/models/customers_credit_models.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../bluetooth/state/bluetooth_cubit.dart';
import '../../../bluetooth/widgets/bluetooth_print_print_receipt/bluetooth_print_print_receipt_cubit.dart';
import '../../models/customer_models.dart';
import '../../models/truck_models.dart';
import '../../request_response/create_transaction/create_transaction_request.dart';
import '../../request_response/create_transaction/create_transaction_response.dart';
import '../../request_response/get_all_items/get_all_items_response.dart';
import '../../request_response/get_transactions_by_customer_id/get_transactions_by_customer_id_response.dart';
import '../../services/transaction_service.dart';
import '../get_transactions_by_customer_id/get_transactions_by_customer_id_cubit.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'sell_screen_lot_sale_template_state.dart';

part 'sell_screen_lot_sale_template_cubit.freezed.dart';

class SellScreenLotSaleTemplateCubit
    extends BaseCubit<SellScreenLotSaleTemplateState> {
  late TransactionService transactionService;
  SellScreenLotSaleTemplateCubit({required super.context})
      : super(initialState: SellScreenLotSaleTemplateState.initial(loadingButton: false, formValid: false)){
    transactionService = GetIt.instance<TransactionService>();
  }

  setLoadingButtonStatus(bool? val) {
    emitState(state.copyWith(loadingButton: val));
  }


  void setSelectedTruck(Trucks? truck) =>
      emit(state.copyWith(selectedTruck: truck, selectedItem: null));

  void setSelectedItem(String? item) =>
      emit(state.copyWith(selectedItem: item));

  void setSelectedCustomer(Customers? customer) =>
      emit(state.copyWith(selectedCustomer: customer));

  void setLotSize(int? lotSize) => emit(state.copyWith(lotSize: lotSize));

  void setConstPrice(double? constPrice) =>
      emit(state.copyWith(constPrice: constPrice));

  void setItemWeight(double? itemWeight) =>
      emit(state.copyWith(itemWeight: itemWeight));

  void setPurchaseType(String purchaseType) =>
      emit(state.copyWith(purchaseType: purchaseType));


  CreateTransactionRequest createRequestData({
    String? trucknumber,
    int? truckid,
    double? fullweight,
    double? weight,
    String? item,
    int? customerid,
    String? purchasetype,
    double? price,
    int? bags,
    String? enteredvia
  }) {
    final request = CreateTransactionRequest(
        trucknumber: trucknumber ?? state.selectedTruck?.number,
        truckid: truckid ?? state.selectedTruck?.id,
        fullweight: fullweight ?? state.itemWeight ?? 1,
        weight: weight ?? state.itemWeight ?? 1,
        items: item ?? state.selectedItem,
        customerid: customerid ?? state.selectedCustomer?.id,
        price: price ?? state.constPrice,
        purchasetype: purchasetype ?? state.purchaseType,
        bags: bags ?? state.lotSize,
        enteredvia: "lotSale"
    );
    return request;
  }

  Future<CreateTransactionResponse> createTransaction(
      CreateTransactionRequest request) async {
    return transactionService.createTransaction(request).then((value) {
      emit(state.copyWith(
          createTransactionResponse: value,
          createTransactionStatus: BooleanStatus.success));
      showSuccessSnackBar("Transaction Created Successfully");
      return Future.value(value);
    }).catchError((error) {
      emit(state.copyWith(createTransactionStatus: BooleanStatus.error));
      showErrorMessage("Failed to create transaction");
      throw error;
    });
  }


  bool validateForm() {
    if (state.selectedTruck == null || state.selectedItem == null || state.selectedCustomer == null || state.constPrice == null ||
        state.lotSize == null || state.purchaseType == null) {
      return false;
    }
    return true;
  }

  void showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.black,
        duration: Duration(seconds: 3),
      ),
    );
  }


}
