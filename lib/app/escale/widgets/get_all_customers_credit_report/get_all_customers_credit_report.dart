import 'package:basic/app/core/database/boolean_status.dart';
import 'package:basic/app/escale/widgets/update_customer_credit_popup/update_customer_credit_popup.dart';
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

import 'get_all_customers_credit_report_controller.dart';
import 'get_all_customers_credit_report_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class GetAllCustomersCreditReport extends BaseStatelessWidget<
    GetAllCustomersCreditReportController,
    GetAllCustomersCreditReportCubit,
    GetAllCustomersCreditReportState> {
  String filterQuery;
  String sortOption;
  GetAllCustomersCreditReport(
      {Key? key, super.controller, super.onStateChanged, required this.filterQuery, required this.sortOption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetAllCustomersCreditReportCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<GetAllCustomersCreditReportCubit,
          GetAllCustomersCreditReportState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final actualTransactions = state.getAllCustomersCreditReportResponse;
          final transactions = actualTransactions
              ?.where((customer) => customer.customerName!.toLowerCase().contains(filterQuery.toLowerCase()))
              .toList();
          final isLargeScreen = MediaQuery.of(context).size.width > 600;

          if (sortOption == "2") {
            transactions?.sort((a, b) {
              DateTime aLatestDate = a.items!
                  .map((item) => DateTime.parse(item.createdAt!))
                  .reduce((a, b) => a.isAfter(b) ? a : b);

              DateTime bLatestDate = b.items!
                  .map((item) => DateTime.parse(item.createdAt!))
                  .reduce((a, b) => a.isAfter(b) ? a : b);

              return aLatestDate.compareTo(bLatestDate);
            });
          }
          else if (sortOption == "1") {
            transactions?.sort((a, b) =>
                b.items!.fold(0, (sum, item) => sum + (item.totalCredit ?? 0))
                    .compareTo(
                    a.items!.fold(0, (sum, item) => sum + (item.totalCredit ?? 0))));
          }
          else if (sortOption == "0") {}

          return state.getAllCustomersCreditReportResponse != null
              ? Container(
                  color: AppColors.bgLightGrey,
                  child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    columnWidths: {
                      0: IntrinsicColumnWidth(),
                      1: FlexColumnWidth(2),
                      2: FlexColumnWidth(),
                      3: FlexColumnWidth(),
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
                              child: Text("Total Credit",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: Fonts.f600)),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: edge_insets_x_16,
                              child: Text("Actions",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: Fonts.f600)),
                            ),
                          ),
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
                                    "\u20B9 ${transactions[i].items?.fold(0, (sum, item) => sum + (item.totalCredit ?? 0))}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontWeight: Fonts.f600)),
                              ),
                            ),
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: edge_insets_x_4_y_8,
                                child: Row(
                                  children: [
                                    UpdateCustomerCreditPopup(
                                      report: transactions[i],
                                      onPopupClosed: (popupData) async {
                                        if (popupData.status ==
                                            BooleanStatus.success) {
                                          await getCubit(context)
                                              .getAllCustomersCreditReport(
                                                  getCubit(context)
                                                      .createRequestData());
                                        }
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                )
              : Center(
                  child: LoadingWidget.loadingWidget(context),
                );
        },
      ),
    );
  }

  @override
  GetAllCustomersCreditReportCubit createCubitAndAssignToController(
      BuildContext context) {
    GetAllCustomersCreditReportCubit cubit =
        GetAllCustomersCreditReportCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
