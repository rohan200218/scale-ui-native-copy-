import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../models/customer_models.dart';
import '../../models/truck_models.dart';
import '/app/themes/app_colors.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';
import '/app/core/modals/base_modal/base_modal_widget.dart';
import 'bulk_update_price_popup_content/bulk_update_price_popup_content.dart';
import 'bulk_update_price_popup_controller.dart';
import 'bulk_update_price_popup_cubit.dart';
import 'bulk_update_price_popup_data.dart';

import '/app/core/widgets/base_stateless_widget.dart';
import 'package:basic/app/core/modals/base_alert_popup/base_alert_popup.dart';

class BulkUpdatePricePopup
    extends BaseAlertPopupWidget<BulkUpdatePricePopupController,
        BulkUpdatePricePopupCubit,
        BulkUpdatePricePopupState,
        BulkUpdatePricePopupData> {
  int selectedCustomer;
  int selectedTruck;
  bool allSelected;
  BulkUpdatePricePopup(
      {Key? key, super.controller, super.onStateChanged, super.onPopupClosed, required this.selectedCustomer, required this.selectedTruck, required this.allSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BulkUpdatePricePopupCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<BulkUpdatePricePopupCubit, BulkUpdatePricePopupState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Container(
            child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: AppColors.bgPrimary,
                    disabledBackgroundColor: AppColors.grey1,
                    shape: RoundedRectangleBorder(
                        borderRadius: borderRadius
                            .br_5),
                    padding: edge_insets_x_8),
                onPressed: (allSelected != true)
                    ? null
                    : (){
                  openPopup(context: context, cubit: getCubit(context));
                },
                child: Text("Price", style: TextStyle(
                  color: AppColors.white
                ),)
            ),
          );
        },
      ),
    );
  }

  @override
  BulkUpdatePricePopupCubit createCubitAndAssignToController(
      BuildContext context) {
    BulkUpdatePricePopupCubit cubit = BulkUpdatePricePopupCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

  @override
  Widget getPopupContentWidget({required BuildContext context}) {
    return BulkUpdatePricePopupContent(selectedCustomer: selectedCustomer, selectedTruck: selectedTruck,);
  }
}
