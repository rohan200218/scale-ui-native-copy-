import 'package:basic/app/core/database/boolean_status.dart';
import 'package:basic/app/escale/widgets/delete_return_transaction_popup/delete_return_transaction_popup.dart';
import 'package:basic/app/escale/widgets/delete_transaction_popup/delete_transaction_popup.dart';
import 'package:basic/app/escale/widgets/return_receipt_popup/return_receipt_popup.dart';
import 'package:basic/app/themes/loading_widget.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/fonts.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'get_all_return_transactions_controller.dart';
import 'get_all_return_transactions_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class GetAllReturnTransactions
    extends BaseStatelessWidget<GetAllReturnTransactionsController,
        GetAllReturnTransactionsCubit,
        GetAllReturnTransactionsState> {
  String filterQuery;
  GetAllReturnTransactions({Key? key, super.controller, super.onStateChanged, required this.filterQuery})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetAllReturnTransactionsCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          GetAllReturnTransactionsCubit,
          GetAllReturnTransactionsState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final actualTransactions = state.getAllReturnTransactionsResponse;
          final transactions = actualTransactions
              ?.where((customer) => customer.customerName!.toLowerCase().contains(filterQuery.toLowerCase()))
              .toList();
          return state.getAllReturnTransactionsResponse != null
              ? Container(
            color: AppColors.bgLightGrey,
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: {
                0: IntrinsicColumnWidth(),
                1: FlexColumnWidth(2),
                2: FlexColumnWidth(),
                3: FlexColumnWidth(),
                4: FlexColumnWidth(),
                5: FlexColumnWidth(),
                // 6: IntrinsicColumnWidth()
              },
              border: TableBorder.all(
                color: AppColors.bgPrimary,
                width: 1,
              ),
              children: [
                TableRow(
                  children: [
                    TableCell(
                      verticalAlignment:
                      TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: edge_insets_x_16,
                        child: Text("Sl",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: Fonts.f600)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment:
                      TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: edge_insets_x_16,
                        child: Text("Customer",
                            style: TextStyle(fontWeight: Fonts.f600)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment:
                      TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: edge_insets_x_4_y_8,
                        child: Text("Amount",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: Fonts.f600)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment:
                      TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: edge_insets_x_4_y_8,
                        child: Text("Payment Type",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: Fonts.f600)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment:
                      TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: edge_insets_x_4_y_8,
                        child: Text("Receipt",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: Fonts.f600)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment:
                      TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: edge_insets_x_4_y_8,
                        child: Text("Location",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: Fonts.f600)),
                      ),
                    ),
                    // TableCell(
                    //   verticalAlignment:
                    //   TableCellVerticalAlignment.middle,
                    //   child: Padding(
                    //     padding: edge_insets_x_4_y_8,
                    //     child: Text("Delete",
                    //         textAlign: TextAlign.center,
                    //         style: TextStyle(fontWeight: Fonts.f600)),
                    //   ),
                    // ),
                  ],
                ),
                for (var i = 0; i < transactions!.length; i++)
                  TableRow(
                    children: [
                      TableCell(
                        verticalAlignment:
                        TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: edge_insets_x_4_y_8,
                          child: Text(
                            (i + 1).toString(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment:
                        TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: edge_insets_x_16,
                          child: Text(
                            transactions[i].customerName.toString(),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment:
                        TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: edge_insets_x_4_y_8,
                          child: Text(
                              "\u20B9 ${transactions[i].amountReturned}",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: Fonts.f600)),
                        ),
                      ),
                      TableCell(
                        verticalAlignment:
                        TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: edge_insets_x_4_y_8,
                          child: Text(
                              transactions[i].returnType!.replaceAll('-for-credit', ''),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: Fonts.f600)),
                        ),
                      ),
                      TableCell(
                        verticalAlignment:
                        TableCellVerticalAlignment.middle,
                        child: transactions[i].receipt == "no-files-uploaded" ? Icon(Icons.do_disturb_alt_rounded): ReturnReceiptPopup(
                          barrierDismissible: true,
                          transaction: transactions[i],
                        ),
                      ),
                      TableCell(
                        verticalAlignment:
                        TableCellVerticalAlignment.middle,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.bgPrimary.withOpacity(0.1),
                            // // Optional background color
                            // borderRadius: borderRadius.br_100, // Makes the container circular
                          ),
                          child: IconButton(
                              padding: edge_insets_0,
                              onPressed: () {
                                getCubit(context).launchLocation(transactions[i].location.toString());
                              },
                              icon: Icon(Icons.location_pin, color: AppColors.bgPrimary2, size: 23,)
                          ),
                        ),
                      ),
                      // TableCell(
                      //   verticalAlignment:
                      //   TableCellVerticalAlignment.middle,
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       color: AppColors.bgPrimary.withOpacity(0.1),
                      //       // // Optional background color
                      //       // borderRadius: borderRadius.br_100, // Makes the container circular
                      //     ),
                      //     child: DeleteReturnTransactionPopup(
                      //         transaction: transactions[i],
                      //       onPopupClosed: (popupStatus) async{
                      //           if(popupStatus.status == BooleanStatus.success){
                      //             await getCubit(context).getAllReturnTransactions(getCubit(context).createRequestData());
                      //           }
                      //       },
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
              ],
            ),
          )
              : state.getAllReturnTransactionsStatus == BooleanStatus.error 
              ? Center(
            child: Text("No statements available"),
          )
              : Center(
            child: LoadingWidget.loadingWidget(context),
          );
        },
      ),
    );
  }

  @override
  GetAllReturnTransactionsCubit createCubitAndAssignToController(
      BuildContext context) {
    GetAllReturnTransactionsCubit cubit = GetAllReturnTransactionsCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
