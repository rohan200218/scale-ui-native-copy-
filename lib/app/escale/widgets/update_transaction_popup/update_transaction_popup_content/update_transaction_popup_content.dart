import 'package:basic/app/core/database/boolean_status.dart';
import 'package:basic/app/core/modals/popup_data.dart';
import 'package:basic/app/escale/widgets/update_transaction_form/update_transaction_form.dart';
import 'package:basic/app/escale/widgets/update_transaction_form/update_transaction_form_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../models/customer_models.dart';
import '../../../models/transaction_models.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';
import 'package:basic/app/core/widgets/base_alert_dialog.dart';
import 'package:basic/app/escale/widgets/update_transaction_popup/update_transaction_popup_data.dart';
import 'update_transaction_popup_content_controller.dart';
import 'update_transaction_popup_content_cubit.dart';

import 'package:basic/app/core/modals/base_alert_popup_content/base_alert_popup_content.dart';
import '/app/core/widgets/base_stateless_widget.dart';

class UpdateTransactionPopupContent extends BaseAlertPopupContent<
    UpdateTransactionPopupContentController,
    UpdateTransactionPopupContentCubit,
    UpdateTransactionPopupContentState,
    UpdateTransactionPopupData> {
  List<Customers> customers;
  Transactions transaction;
  Customers? selectedCustomer;
  UpdateTransactionFormController updateTransactionFormController =
      UpdateTransactionFormController();

  UpdateTransactionPopupContent(
      {Key? key,
      super.controller,
      super.onStateChanged,
        this.selectedCustomer,
      required this.customers,
      required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UpdateTransactionPopupContentCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<UpdateTransactionPopupContentCubit,
          UpdateTransactionPopupContentState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return BaseAlertDialog(
            loadingButton: state.loadingButton!,
            title: 'Update Transaction',
            body: UpdateTransactionForm(
              selectedCustomer: selectedCustomer,
              controller: updateTransactionFormController,
              customers: customers,
              transaction: transaction,
              onStateChanged: (updateTransactionFormState) => getCubit(context)
                  .emitState(state.copyWith(
                      updateTransactionFormState: updateTransactionFormState)),
            ),
            onSubmit:
                (state.updateTransactionFormState?.updateTransactionStatus ==
                            BooleanStatus.pending ||
                        state.updateTransactionFormState?.formValid !=
                            ControlStatus.valid ||
                        state.loadingButton!)
                    ? null
                    : () async {
                        getCubit(context).setLoadingButtonStatus(true);
                        await updateTransactionFormController
                            .getChildCubit()
                            .updateTransaction(updateTransactionFormController
                                .getChildCubit()
                                .createRequestData(customerid: transaction.customerid ?? selectedCustomer!.id));
                        closePopup(context, PopupData(status: BooleanStatus.success));
                      },
            onClosed: () {
              closePopup(context, PopupData(status: BooleanStatus.closed));
            },
          );
        },
      ),
    );
  }

  @override
  UpdateTransactionPopupContentCubit createCubitAndAssignToController(
      BuildContext context) {
    UpdateTransactionPopupContentCubit cubit =
        UpdateTransactionPopupContentCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
