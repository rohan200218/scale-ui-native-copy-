import 'package:basic/app/escale/services/transaction_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:usb_serial/transaction.dart';
import '../../models/customer_models.dart';
import '../../models/transaction_models.dart';
import '../../request_response/update_transaction/update_transaction_request.dart';
import '../../request_response/update_transaction/update_transaction_response.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'update_transaction_form_state.dart';

part 'update_transaction_form_cubit.freezed.dart';

class UpdateTransactionFormCubit
    extends BaseFormCubit<UpdateTransactionFormState> {
  late TransactionService transactionService;
  UpdateTransactionFormCubit({required super.context, required Transactions transaction})
      : super(initialState: UpdateTransactionFormState.initial(transaction: transaction)){
    transactionService=GetIt.instance<TransactionService>();
  }

  void setSelectedCustomer(Customers? customer) =>
      emit(state.copyWith(selectedCustomer: customer));

  void setPurchaseType(String purchaseType) =>
      emit(state.copyWith(purchaseType: purchaseType));

  Customers? findCustomerById(List<Customers> customers, int? customerId) {
    if (customerId == null) return null;

    for (var customer in customers) {
      if (customer.id == customerId) {
        return customer;
      }
    }
    return null;
  }

  UpdateTransactionRequest createRequestData({
    String? transactionid,
      int? price,
      int? bags,
      int? weight,
      int? customerid,
      String? purchasetype
}) {
        final request = UpdateTransactionRequest(
          transactionid: state.transaction.id,
          customerid: state.selectedCustomer?.id ?? customerid,
          bags: bags ?? int.parse(formGroup.control('bags').value),
          price: price ?? int.parse(formGroup.control('price').value),
          weight: weight ?? int.parse(formGroup.control('weight').value),
          purchasetype: purchasetype ?? state.purchaseType ?? state.transaction.purchasetype
        );
        return request;
      }

    Future<void> updateTransaction(
          UpdateTransactionRequest request) async {
        return transactionService.updateTransaction(request).then((value) {
          emit(state.copyWith(
              updateTransactionStatus: BooleanStatus.success));
          showSuccessMessage("Transaction updated successfully");
          return value;
        }).catchError((error) {
          emit(state.copyWith(updateTransactionStatus: BooleanStatus.error));
          showErrorMessage("Failed to update transaction");
          throw error;
        });
      }

  @override
  FormGroup getFormGroup() {
    return FormGroup({
      'items': FormControl<String>(),
      'bags': FormControl<String>(validators: [Validators.required]),
      'weight': FormControl<String>(validators: [Validators.required]),
      'purchasetype': FormControl<String>(validators: [Validators.required]),
      'price': FormControl<String>(validators: [Validators.required]),
    });
  }

  @override
  void afterInitialize(FormGroup formGroup) {
    formGroup.control('items').value = state.transaction.items;
    formGroup.control('price').value = state.transaction.price?.toStringAsFixed(0);
    formGroup.control('bags').value = state.transaction.bags?.toStringAsFixed(0);
    formGroup.control('weight').value = state.transaction.weight?.toStringAsFixed(0);
    formGroup.control('purchasetype').value = state.transaction.purchasetype;
  }

  @override
  void updateFormValidationState(ControlStatus event) {
    emit(state.copyWith(formValid: event));
  }
}
