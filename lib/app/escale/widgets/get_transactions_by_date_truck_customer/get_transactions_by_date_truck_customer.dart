import 'package:basic/app/core/database/boolean_status.dart';
import 'package:basic/app/escale/widgets/delete_transaction_popup/delete_transaction_popup.dart';
import 'package:basic/app/escale/widgets/update_transaction_popup/update_transaction_popup.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../core/modals/popup_data.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/fonts.dart';
import '../../models/customer_models.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'get_transactions_by_date_truck_customer_controller.dart';
import 'get_transactions_by_date_truck_customer_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class GetTransactionsByDateTruckCustomer
    extends BaseStatelessWidget<GetTransactionsByDateTruckCustomerController,
        GetTransactionsByDateTruckCustomerCubit,
        GetTransactionsByDateTruckCustomerState> {
  int? customerid;
  int? truckid;
  String? date;
  List<Customers> customers;
  Customers? selectedCustomer;

  GetTransactionsByDateTruckCustomer(
      {Key? key, super.controller, super.onStateChanged, this.truckid, this.customerid, this.date, required this.customers, this.selectedCustomer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetTransactionsByDateTruckCustomerCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          GetTransactionsByDateTruckCustomerCubit,
          GetTransactionsByDateTruckCustomerState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final transactions = state.getAllTransactionsResponse;
          final isLargeScreen = MediaQuery
              .of(context)
              .size
              .width > 600;
          return transactions != null
              ? transactions.isNotEmpty
              ? Container(
            margin: edge_insets_t_16,
            color: AppColors.bgLightGrey,
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: {
                0: IntrinsicColumnWidth(),
                1: isLargeScreen ? IntrinsicColumnWidth() : FlexColumnWidth(),
                2: isLargeScreen ? FlexColumnWidth() : IntrinsicColumnWidth(),
                3: isLargeScreen ? FlexColumnWidth() : IntrinsicColumnWidth(),
                4: isLargeScreen ? FlexColumnWidth() : IntrinsicColumnWidth(),
                5: isLargeScreen ? FlexColumnWidth() : IntrinsicColumnWidth(),
                6: isLargeScreen ? IntrinsicColumnWidth() : FlexColumnWidth(),
                // 7: isLargeScreen? FlexColumnWidth() : IntrinsicColumnWidth(),
              },
              border: TableBorder.all(
                color: AppColors.bgPrimary,
                width: 1,
              ),
              children: [
                TableRow(
                  children: [
                    TableCell(
                      child: Container(
                        width: 40,
                        child: Checkbox(
                          value: state.allSelected,
                          onChanged: (value) {
                            getCubit(context).toggleSelectAll(value!);
                          },
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: edge_insets_x_4_y_8,
                        child: Text("Item",
                            style: TextStyle(fontWeight: Fonts.f600)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: edge_insets_x_4_y_8,
                        child: Text("Bags", textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: Fonts.f600)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: edge_insets_x_4_y_8,
                        child: Text("Weight", textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: Fonts.f600)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: edge_insets_x_4_y_8,
                        child: Text("Txn type", textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: Fonts.f600)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: edge_insets_x_4_y_8,
                        child: Text("Price", textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: Fonts.f600)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: edge_insets_x_4_y_8,
                        child: Text("Actions", textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: Fonts.f600)),
                      ),
                    ),
                    // isLargeScreen ?  : TableCell(child: SizedBox(),),
                    // TableCell(
                    //   verticalAlignment: TableCellVerticalAlignment.middle,
                    //   child: Padding(
                    //     padding: edge_insets_x_4_y_8,
                    //     child: Text("Del", textAlign: TextAlign.center,
                    //         style: TextStyle(fontWeight: Fonts.f600)),
                    //   ),
                    // )
                    // isLargeScreen ?  : TableCell(child: SizedBox(),),
                  ],
                ),
                for (var i = 0; i < transactions.length; i++)
                  TableRow(
                    children: [
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Container(
                          width: isLargeScreen ? 60 : 40,
                          padding: edge_insets_0,
                          child: Checkbox(
                            value: state.selectedTransactions.contains(
                                transactions[i]),
                            onChanged: (value) {
                              getCubit(context).toggleTransactionSelection(
                                  transactions[i], value!);
                            },
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Container(
                          margin: isLargeScreen ? edge_insets_r_40 : null,
                          padding: edge_insets_x_4_y_8,
                          child: Text(transactions[i].items!,
                              style: TextStyle(fontWeight: Fonts.f600)),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: edge_insets_x_4_y_8,
                          child: Text(transactions[i].bags.toString(),
                            textAlign: TextAlign.center,),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: edge_insets_x_4_y_8,
                          child: Text(transactions[i].weight.toString(),
                            textAlign: TextAlign.center,),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: edge_insets_x_4_y_8,
                          child: Text(
                              transactions[i].purchasetype.toString().toUpperCase(),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: edge_insets_x_4_y_8,
                          child: Text(transactions[i].price.toString(),
                            textAlign: TextAlign.center,),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: edge_insets_x_4_y_8,
                          child: Wrap(
                            children: [
                              Container(
                                height: 40,
                                child: UpdateTransactionPopup(
                                  selectedCustomer: selectedCustomer,
                                  customers: customers,
                                  transaction: transactions[i],
                                  onPopupClosed: (popupData) async {
                                    if (popupData.status ==
                                        BooleanStatus.success) {
                                      await getCubit(context)
                                          .getTransactionsByDateTruckCustomer(
                                          getCubit(context).createRequestData(customerid: customerid, truckid: truckid));
                                    }
                                  },
                                ),),
                              Container(
                                height: 40,
                                child: DeleteTransactionPopup(
                                  transaction: transactions[i],
                                  onPopupClosed: (popupData) async {
                                    if (popupData.status ==
                                        BooleanStatus.success) {
                                      await getCubit(context)
                                          .getTransactionsByDateTruckCustomer(
                                          getCubit(context).createRequestData(customerid: customerid, truckid: truckid));
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      // isLargeScreen ?  : TableCell(child: SizedBox(),),
                      // isLargeScreen ? TableCell(
                      //   verticalAlignment: TableCellVerticalAlignment.middle,
                      //   child: Padding(
                      //     padding: edge_insets_x_4_y_8,
                      //     child: Text("Price", textAlign: TextAlign.center,
                      //         style: TextStyle(fontWeight: Fonts.f600)),
                      //   ),
                      // ) : TableCell(child: SizedBox(),),
                    ],
                  ),
              ],
            ),
          )
              : Container(
            margin: edge_insets_t_24,
            child: Text("no transactions for selected customer and truck today",
              textAlign: TextAlign.center,
              style: TextStyle(
              fontSize: Fonts.fontSize16
            ),),
          )
              : Container(
            margin: edge_insets_t_24,
            child: Text("submit to view transactions",
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }

  @override
  GetTransactionsByDateTruckCustomerCubit createCubitAndAssignToController(
      BuildContext context) {
    GetTransactionsByDateTruckCustomerCubit cubit = GetTransactionsByDateTruckCustomerCubit(
        context: context, customerId: customerid, truckId: truckid, date: date);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
