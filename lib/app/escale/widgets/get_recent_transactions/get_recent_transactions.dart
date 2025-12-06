import 'package:basic/app/core/database/boolean_status.dart';
import 'package:basic/app/escale/models/customer_models.dart';
import 'package:basic/app/escale/widgets/delete_transaction_popup/delete_transaction_popup.dart';
import 'package:basic/app/escale/widgets/update_transaction_popup/update_transaction_popup.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/fonts.dart';
import '../../../themes/shadows.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'get_recent_transactions_controller.dart';
import 'get_recent_transactions_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class GetRecentTransactions
    extends BaseStatelessWidget<GetRecentTransactionsController,
        GetRecentTransactionsCubit,
        GetRecentTransactionsState> {
  List<Customers> customers;
  GetRecentTransactions({Key? key, super.controller, super.onStateChanged, required this.customers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetRecentTransactionsCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<GetRecentTransactionsCubit,
          GetRecentTransactionsState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final width = MediaQuery.sizeOf(context).width;
          final largeScreen = width > 600;
          final landscape = MediaQuery.of(context).orientation == Orientation.landscape;
          return state.getAllTransactionsResponse != null
              ? state.getAllTransactionsResponse != null &&
              state.getAllTransactionsResponse!.isNotEmpty
              ? Container(
            height: 90,
            margin: edge_insets_x_5,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.getAllTransactionsResponse!.length,
                itemBuilder: (context, index){
                  final transaction = state.getAllTransactionsResponse![index];
                  return Container(
                    margin: edge_insets_r_2,
                    width: largeScreen
                        ? landscape ? (width - (8.0 * 5)) / 4 : (width - (8.0 * 5)) / 3
                        : (width - (8.0 * 5)) / 2,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        InkWell(
                          child: Container(
                            padding: edge_insets_5,
                            decoration: BoxDecoration(
                                color: transaction.purchasetype?.toLowerCase() == 'credit' || transaction.purchasetype?.toLowerCase() == 'cred'
                                    ? Color.fromRGBO(177, 238, 171, 1)
                                    : transaction.purchasetype?.toLowerCase() == 'upi'
                                    ? Color.fromRGBO(237, 145, 33, 1)
                                    : transaction.purchasetype?.toLowerCase() == 'cash'
                                    ? Color.fromRGBO(217, 141, 177, 1)
                                    : AppColors.transparent,
                                border: borders.b_1px_grey4,
                                borderRadius: borderRadius.br_10),
                            child: Row(
                              // mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${(transaction.customer!.name!.length > 12)
                                              ? '${transaction.customer!.name!.substring(0, 12)}..'
                                              : transaction.customer!.name} - ${transaction.items}",
                                          textAlign: TextAlign.start,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: Fonts.f500,
                                              fontSize: Fonts.fontSize16),
                                        ),
                                        Text(transaction.uom != "lotSale"
                                            ? "${transaction.weight} kg - ${transaction.bags} bags"
                                            : "${transaction.bags} lot - ₹ ${transaction.price}",
                                          style: TextStyle(
                                              fontSize: Fonts.fontSize14),
                                        ),
                                        // Text(transaction.toJson().toString())
                                      ],
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            UpdateTransactionPopup(
                              customers: customers,
                              transaction: transaction,
                              onPopupClosed: (popupData) {
                                if(popupData.status == BooleanStatus.success){
                                  getCubit(context).getRecentTransactions(getCubit(context).createRequestData());
                                }
                              },
                            ),
                            DeleteTransactionPopup(
                              transaction: transaction,
                              onPopupClosed: (popupData) {
                                if(popupData.status == BooleanStatus.success){
                                  getCubit(context).getRecentTransactions(getCubit(context).createRequestData());
                                }
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }
            ),
          )


              : Center(
            child: Container(
              margin: edge_insets_t_16,
              child: Column(
                children: [
                  Image.asset("images/nothing.png"),
                  Text(
                    "Oh no! you have to add something",
                    style: TextStyle(
                        fontWeight: Fonts.f500,
                        fontSize: Fonts.fontSize16),
                  ),
                  Text(
                    "There are nothing present",
                    style: TextStyle(fontSize: Fonts.fontSize16),
                  )
                ],
              ),
            ),
          )
              : Center(
              child: Container(
                height: 90,
                width: MediaQuery.sizeOf(context).width / 1.5,
                decoration: BoxDecoration(
                    boxShadow: const [shadows.bs_primary],
                    color: AppColors.white,
                    borderRadius: borderRadius.br_10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoadingAnimationWidget.discreteCircle(
                        color: AppColors.bgPrimary,
                        size: 50,
                        secondRingColor: AppColors.bmiTracker,
                        thirdRingColor: AppColors.waterPrimary),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Loading \n Please wait",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: Fonts.f500, fontSize: Fonts.fontSize18),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }

  @override
  GetRecentTransactionsCubit createCubitAndAssignToController(
      BuildContext context) {
    GetRecentTransactionsCubit cubit = GetRecentTransactionsCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
