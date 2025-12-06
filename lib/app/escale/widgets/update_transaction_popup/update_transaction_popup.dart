import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../models/customer_models.dart';
import '../../models/transaction_models.dart';
import '/app/themes/borders.dart';
import '/app/themes/app_colors.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';
import '/app/core/modals/base_modal/base_modal_widget.dart';
import 'update_transaction_popup_content/update_transaction_popup_content.dart';
import 'update_transaction_popup_controller.dart';
import 'update_transaction_popup_cubit.dart';
import 'update_transaction_popup_data.dart';

import '/app/core/widgets/base_stateless_widget.dart';
import 'package:basic/app/core/modals/base_alert_popup/base_alert_popup.dart';

class UpdateTransactionPopup
    extends BaseAlertPopupWidget<UpdateTransactionPopupController,
        UpdateTransactionPopupCubit,
        UpdateTransactionPopupState,
        UpdateTransactionPopupData> {
  List<Customers> customers;
  Transactions transaction;
  Customers? selectedCustomer;
  UpdateTransactionPopup(
      {Key? key, super.controller, super.onStateChanged, super.onPopupClosed, required this.customers, required this.transaction, this.selectedCustomer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UpdateTransactionPopupCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          UpdateTransactionPopupCubit,
          UpdateTransactionPopupState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: AppColors.bgPrimary.withOpacity(0.1), // Optional background color
              borderRadius: borderRadius.br_100, // Makes the container circular
            ),
            child: IconButton(
              padding: edge_insets_0,
                onPressed: (){
                  openPopup(context: context, cubit: getCubit(context));
                },
                icon: Icon(Icons.edit, color: AppColors.bgPrimary2, size: 23,)
            ),
          );
        },
      ),
    );
  }

  @override
  UpdateTransactionPopupCubit createCubitAndAssignToController(
      BuildContext context) {
    UpdateTransactionPopupCubit cubit = UpdateTransactionPopupCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

  @override
  Widget getPopupContentWidget({required BuildContext context}) {
    return UpdateTransactionPopupContent(customers: customers, transaction: transaction, selectedCustomer: selectedCustomer,);
  }
}
