import 'package:basic/app/themes/loading_widget.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../core/logger/log.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/fonts.dart';
import '../update_transaction_popup/update_transaction_popup.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'get_transactions_by_date_controller.dart';
import 'get_transactions_by_date_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class GetTransactionsByDate
    extends BaseStatelessWidget<GetTransactionsByDateController,
        GetTransactionsByDateCubit,
        GetTransactionsByDateState> {
  String date;
  GetTransactionsByDate({Key? key, super.controller, super.onStateChanged, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetTransactionsByDateCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<GetTransactionsByDateCubit,
          GetTransactionsByDateState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final transactions = state.getAllTransactionsResponse;
          final filteredTransactions = transactions
              ?.where((transaction) =>
          transaction.purchasetype?.toLowerCase() == 'credit')
              .toList();
          final isLargeScreen = MediaQuery
              .of(context)
              .size
              .width > 600;
          final groupedTransactions = <String, double>{};

          if (filteredTransactions != null) {
            for (var transaction in filteredTransactions) {
              final customerId = transaction.customerid.toString();
              final creditAmount = transaction.bags! * transaction.weight! * transaction.price!;
              if (groupedTransactions.containsKey(customerId)) {
                groupedTransactions[customerId] = groupedTransactions[customerId]! + creditAmount;
              } else {
                groupedTransactions[customerId] = creditAmount.toDouble();
              }
            }
          }

          return transactions != null
              ? groupedTransactions.isNotEmpty
              ? Container(
            color: AppColors.bgLightGrey,
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: {
                0: IntrinsicColumnWidth(),
              },
              border: TableBorder.all(
                color: AppColors.bgPrimary,
                width: 1,
              ),
              children: [
                TableRow(
                  children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: edge_insets_x_16,
                        child: Text("Sl",
                            style: TextStyle(fontWeight: Fonts.f600)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: edge_insets_x_4_y_8,
                        child: Text("Customer", textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: Fonts.f600)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: edge_insets_x_4_y_8,
                        child: Text("Total Credit", textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: Fonts.f600)),
                      ),
                    ),
                  ],
                ),
                for (var i = 0; i < groupedTransactions.length; i++)
                  TableRow(
                    children: [
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: edge_insets_x_4_y_8,
                          child: Text((i + 1).toString(),
                            textAlign: TextAlign.center,),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: edge_insets_x_4_y_8,
                          child: Text(groupedTransactions.keys.elementAt(i),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: Fonts.f600)),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: edge_insets_x_4_y_8,
                          child: Text("${groupedTransactions.values.elementAt(i).toStringAsFixed(0)}",
                            textAlign: TextAlign.center,),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          )
              : Center(
            child: Text("No transactions for selected date",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: Fonts.fontSize16
              ),),
          )
              : Center(
            child: LoadingWidget.loadingWidget(context),
          );
        },
      ),
    );
  }

  @override
  GetTransactionsByDateCubit createCubitAndAssignToController(
      BuildContext context) {
    GetTransactionsByDateCubit cubit = GetTransactionsByDateCubit(
        context: context, date: date);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
