import 'package:basic/app/escale/models/return_transaction_models.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/fonts.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';
import 'package:basic/app/core/widgets/base_alert_dialog.dart';
import '../delete_return_transaction_popup_data.dart';
import 'delete_return_transaction_popup_content_controller.dart';
import 'delete_return_transaction_popup_content_cubit.dart';
import 'package:basic/app/core/database/boolean_status.dart';
import 'package:basic/app/core/modals/popup_data.dart';

import 'package:basic/app/core/modals/base_alert_popup_content/base_alert_popup_content.dart';
import '/app/core/widgets/base_stateless_widget.dart';

class DeleteReturnTransactionPopupContent
    extends BaseAlertPopupContent<DeleteReturnTransactionPopupContentController,
        DeleteReturnTransactionPopupContentCubit,
        DeleteReturnTransactionPopupContentState,
        DeleteReturnTransactionPopupData> {
  ReturnTransactions transaction;
  DeleteReturnTransactionPopupContent(
      {Key? key, super.controller, super.onStateChanged, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeleteReturnTransactionPopupContentCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          DeleteReturnTransactionPopupContentCubit,
          DeleteReturnTransactionPopupContentState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final isLargeScreen = MediaQuery.of(context).size.width > 600;
          return BaseAlertDialog(
            loadingButton: state.loadingButton!,
            title: 'Delete Transaction',
            body: Container(
              padding: edge_insets_16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Are you sure you want to delete?", style: TextStyle(
                    fontSize: Fonts.fontSize16,
                  ),),
                  SizedBox(height: 10,),
                  Table(
                    columnWidths: {
                      0: isLargeScreen ? IntrinsicColumnWidth() : FlexColumnWidth(),
                      1: isLargeScreen ? FlexColumnWidth() : IntrinsicColumnWidth(),
                      2: isLargeScreen ? FlexColumnWidth() : IntrinsicColumnWidth(),
                      3: isLargeScreen ? FlexColumnWidth() : FlexColumnWidth(),
                      4: isLargeScreen ? FlexColumnWidth() : IntrinsicColumnWidth(),
                      // 7: isLargeScreen? FlexColumnWidth() : IntrinsicColumnWidth(),
                    },
                    border: TableBorder.all(
                      color: AppColors.grey4,
                      width: 1,
                    ),
                    children: [
                      TableRow(
                          children: [
                            TableCell(
                              verticalAlignment: TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: edge_insets_x_4_y_8,
                                child: Text("Customer",
                                    style: TextStyle(fontWeight: Fonts.f600)),
                              ),
                            ),
                            TableCell(
                              verticalAlignment: TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: edge_insets_x_4_y_8,
                                child: Text("Amount", textAlign: TextAlign.center,
                                    style: TextStyle(fontWeight: Fonts.f600)),
                              ),
                            ),
                            TableCell(
                              verticalAlignment: TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: edge_insets_x_4_y_8,
                                child: Text("Amount type", textAlign: TextAlign.center,
                                    style: TextStyle(fontWeight: Fonts.f600)),
                              ),
                            ),
                          ]
                      ),
                      TableRow(
                          children: [
                            TableCell(
                              verticalAlignment: TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: edge_insets_x_4_y_8,
                                child: Text(transaction.customerName!,
                                    style: TextStyle(fontWeight: Fonts.f600)),
                              ),
                            ),
                            TableCell(
                              verticalAlignment: TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: edge_insets_x_4_y_8,
                                child: Text(transaction.amountReturned.toString(), textAlign: TextAlign.center,
                                    style: TextStyle(fontWeight: Fonts.f600)),
                              ),
                            ),
                            TableCell(
                              verticalAlignment: TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: edge_insets_x_4_y_8,
                                child: Text(transaction.returnType.toString(), textAlign: TextAlign.center,
                                    style: TextStyle(fontWeight: Fonts.f600)),
                              ),
                            ),
                          ]
                      )
                    ],
                  ),
                ],
              ),
            ),
            submitButtonTitle: "Delete",
            submitButtonTitleColor: AppColors.bgRed,
            submitButtonStyle: OutlinedButton.styleFrom(
              foregroundColor: AppColors.bgRed,
              shape: RoundedRectangleBorder(borderRadius: borderRadius.br_5),
              side: const BorderSide(width: 2, color: AppColors.bgRed),
            ),
            onSubmit: () async{
              getCubit(context).setLoadingButtonStatus(true);
              await getCubit(context).deleteTransaction(getCubit(context).createRequestData(
                  transactionid: transaction.id
              ));
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
  DeleteReturnTransactionPopupContentCubit createCubitAndAssignToController(
      BuildContext context) {
    DeleteReturnTransactionPopupContentCubit cubit = DeleteReturnTransactionPopupContentCubit(
        context: context, transaction: transaction);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
