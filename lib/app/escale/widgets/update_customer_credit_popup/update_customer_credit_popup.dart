import 'package:basic/app/escale/models/customer_models.dart';
import 'package:basic/app/escale/models/customers_credit_models.dart';
import 'package:basic/app/escale/models/transaction_models.dart';
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
import 'update_customer_credit_popup_content/update_customer_credit_popup_content.dart';
import 'update_customer_credit_popup_controller.dart';
import 'update_customer_credit_popup_cubit.dart';
import 'update_customer_credit_popup_data.dart';

import '/app/core/widgets/base_stateless_widget.dart';
import 'package:basic/app/core/modals/base_alert_popup/base_alert_popup.dart';

class UpdateCustomerCreditPopup
    extends BaseAlertPopupWidget<UpdateCustomerCreditPopupController,
        UpdateCustomerCreditPopupCubit,
        UpdateCustomerCreditPopupState,
        UpdateCustomerCreditPopupData> {
  CustomerCreditReport report;
  UpdateCustomerCreditPopup(
      {Key? key, super.controller, super.onStateChanged, super.onPopupClosed, required this.report})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UpdateCustomerCreditPopupCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          UpdateCustomerCreditPopupCubit,
          UpdateCustomerCreditPopupState>(
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
  UpdateCustomerCreditPopupCubit createCubitAndAssignToController(
      BuildContext context) {
    UpdateCustomerCreditPopupCubit cubit = UpdateCustomerCreditPopupCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

  @override
  Widget getPopupContentWidget({required BuildContext context}) {
    return UpdateCustomerCreditPopupContent(report: report);
  }
}
