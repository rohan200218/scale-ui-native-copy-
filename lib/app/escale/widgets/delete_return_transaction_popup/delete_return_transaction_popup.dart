import 'package:basic/app/escale/models/return_transaction_models.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:basic/app/core/database/boolean_status.dart';
import 'package:basic/app/core/modals/popup_data.dart';
import '/app/themes/borders.dart';
import '/app/themes/app_colors.dart';
import '/app/themes/edge_insets.dart';
import '/app/themes/shadows.dart';
import 'package:go_router/go_router.dart';
import '/app/core/modals/base_modal/base_modal_widget.dart';
import 'delete_return_transaction_popup_content/delete_return_transaction_popup_content.dart';
import 'delete_return_transaction_popup_controller.dart';
import 'delete_return_transaction_popup_cubit.dart';
import 'delete_return_transaction_popup_data.dart';

import '/app/core/widgets/base_stateless_widget.dart';
import 'package:basic/app/core/modals/base_alert_popup/base_alert_popup.dart';

class DeleteReturnTransactionPopup
    extends BaseAlertPopupWidget<DeleteReturnTransactionPopupController,
        DeleteReturnTransactionPopupCubit,
        DeleteReturnTransactionPopupState,
        DeleteReturnTransactionPopupData> {
  ReturnTransactions transaction;
  DeleteReturnTransactionPopup(
      {Key? key, super.controller, super.onStateChanged, super.onPopupClosed, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeleteReturnTransactionPopupCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          DeleteReturnTransactionPopupCubit,
          DeleteReturnTransactionPopupState>(
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
              color: AppColors.bgPrimary.withOpacity(0.1),
              // Optional background color
              borderRadius: borderRadius.br_100, // Makes the container circular
            ),
            child: IconButton(
                padding: edge_insets_0,
                onPressed: () {
                  openPopup(context: context, cubit: getCubit(context));
                },
                icon: Icon(Icons.delete_forever_outlined, color: AppColors.bgRed, size: 23,)
            ),
          );
        },
      ),
    );
  }

  @override
  DeleteReturnTransactionPopupCubit createCubitAndAssignToController(
      BuildContext context) {
    DeleteReturnTransactionPopupCubit cubit = DeleteReturnTransactionPopupCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

  @override
  Widget getPopupContentWidget({required BuildContext context}) {
    return DeleteReturnTransactionPopupContent(transaction: transaction);
  }
}
