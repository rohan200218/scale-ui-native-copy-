import 'package:basic/app/core/database/boolean_status.dart';
import 'package:basic/app/core/logger/log.dart';
import 'package:basic/app/core/utils/date_time/app_date_time_utils.dart';
import 'package:basic/app/escale/request_response/get_all_customers/get_all_customers_response.dart';
import 'package:basic/app/escale/request_response/get_all_trucks/get_all_trucks_response.dart';
import 'package:basic/app/escale/widgets/bulk_update_cash/bulk_update_cash.dart';
import 'package:basic/app/escale/widgets/bulk_update_cash/bulk_update_cash_controller.dart';
import 'package:basic/app/escale/widgets/bulk_update_credit/bulk_update_credit.dart';
import 'package:basic/app/escale/widgets/bulk_update_credit/bulk_update_credit_controller.dart';
import 'package:basic/app/escale/widgets/bulk_update_price_popup/bulk_update_price_popup.dart';
import 'package:basic/app/escale/widgets/bulk_update_price_popup/bulk_update_price_popup_controller.dart';
import 'package:basic/app/escale/widgets/customer_dropdown/customer_dropdown.dart';
import 'package:basic/app/escale/widgets/get_all_customers/get_all_customers.dart';
import 'package:basic/app/escale/widgets/get_all_trucks/get_all_trucks.dart';
import 'package:basic/app/escale/widgets/get_transactions_by_date_truck_customer/get_transactions_by_date_truck_customer.dart';
import 'package:basic/app/escale/widgets/get_transactions_by_date_truck_customer/get_transactions_by_date_truck_customer_controller.dart';
import 'package:basic/app/escale/widgets/trucks_dropdown/trucks_dropdown.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:basic/app/themes/app_colors.dart';
import 'package:basic/app/themes/edge_insets.dart';
import 'package:basic/app/themes/fonts.dart';

import '../../../core/widgets/app_scaffold.dart';
import '../../../themes/borders.dart';
import 'adjustment_screen_controller.dart';
import 'adjustment_screen_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class AdjustmentScreen extends BaseStatelessWidget<AdjustmentScreenController,
    AdjustmentScreenCubit, AdjustmentScreenState> {
  late List<GetAllTrucksResponse> trucksData = [];
  late List<GetAllCustomersResponse> customersData = [];
  GetTransactionsByDateTruckCustomerController
      getTransactionsByDateTruckCustomerController =
      GetTransactionsByDateTruckCustomerController();
  BulkUpdateCashController bulkUpdateCashController =
      BulkUpdateCashController();
  BulkUpdateCreditController bulkUpdateCreditController =
      BulkUpdateCreditController();
  BulkUpdatePricePopupController bulkUpdatePricePopupController =
      BulkUpdatePricePopupController();

  AdjustmentScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdjustmentScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<AdjustmentScreenCubit, AdjustmentScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final isLargeScreen = MediaQuery.of(context).size.width > 600;
          return AppScaffold(
            appBarTitle: Text("Adjustments"),
            body: Container(
              padding: edge_insets_16,
              child: Column(
                children: [
                  Container(
                    padding: edge_insets_10,
                    decoration: BoxDecoration(
                        border: borders.b_1px_bgPrimary,
                        borderRadius: borderRadius.br_5,
                        color: AppColors.bgLightGrey),
                    child: Column(
                      children: [
                        GetAllTrucksNoTemplate(onTrucksFetched: (trucks) {
                          getCubit(context).emitState(
                              state.copyWith(getAllTrucksResponse: trucks));
                          trucksData = trucks;
                        }),
                        GetAllCustomersNoTemplate(
                            onCustomersLoaded: (customers) {
                          getCubit(context).emitState(state.copyWith(
                              getAllCustomersResponse: customers));
                          customersData = customers;
                        }),
                        Container(
                          height: isLargeScreen ? 40 : 90,
                          child: Flex(
                            mainAxisSize: MainAxisSize.min,
                            direction:
                                isLargeScreen ? Axis.horizontal : Axis.vertical,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TrucksDropdown(
                                  onChanged: (truck) {
                                    getCubit(context).setSelectedTruck(truck);
                                  },
                                  trucks:
                                      state.getAllTrucksResponse ?? trucksData,
                                ),
                              ),
                              SizedBox(
                                  width: isLargeScreen ? 12 : 0,
                                  height: isLargeScreen ? 0 : 10), // Spacer
                              Expanded(
                                child: CustomerDropdown(
                                  onChanged: (customer) {
                                    getCubit(context)
                                        .setSelectedCustomer(customer);
                                  },
                                  customers: state.getAllCustomersResponse ??
                                      customersData,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          alignment: Alignment.centerRight,
                          margin: edge_insets_t_8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Row(
                                children: [
                                  BulkUpdateCash(
                                    controller: bulkUpdateCashController,
                                    onStateChanged: (bulkUpdateCashState) =>
                                        getCubit(context).emitState(
                                            state.copyWith(
                                                bulkUpdateCashState:
                                                    bulkUpdateCashState)),
                                  ),
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          backgroundColor: AppColors.bgPrimary,
                                          disabledBackgroundColor:
                                              AppColors.grey1,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: borderRadius.br_5),
                                          padding: edge_insets_x_8),
                                      onPressed:
                                          (state.getTransactionsByDateTruckCustomerState
                                                          ?.allSelected !=
                                                      true ||
                                                  state.bulkUpdateCashState
                                                          ?.bulkUpdateCashStatus ==
                                                      BooleanStatus.pending)
                                              ? null
                                              : () async {
                                                  await bulkUpdateCashController
                                                      .getChildCubit()
                                                      .bulkUpdateToCash(
                                                          bulkUpdateCashController
                                                              .getChildCubit()
                                                              .createRequestData(
                                                                  customer: state
                                                                      .selectedCustomer
                                                                      ?.id,
                                                                  truck: state
                                                                      .selectedTruck
                                                                      ?.id));
                                                  fetchTransactions(
                                                      context, state);
                                                },
                                      child: Text(
                                        "CASH",
                                        style:
                                            TextStyle(color: AppColors.white),
                                      )),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  BulkUpdateCredit(
                                    controller: bulkUpdateCreditController,
                                    onStateChanged: (bulkUpdateCreditState) =>
                                        getCubit(context).emitState(
                                            state.copyWith(
                                                bulkUpdateCreditState:
                                                    bulkUpdateCreditState)),
                                  ),
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          backgroundColor: AppColors.bgPrimary,
                                          disabledBackgroundColor:
                                              AppColors.grey1,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: borderRadius.br_5),
                                          padding: edge_insets_x_8),
                                      onPressed:
                                          (state.getTransactionsByDateTruckCustomerState
                                                          ?.allSelected !=
                                                      true ||
                                                  state.bulkUpdateCreditState
                                                          ?.bulkUpdateStatus ==
                                                      BooleanStatus.pending)
                                              ? null
                                              : () async {
                                                  await bulkUpdateCreditController
                                                      .getChildCubit()
                                                      .bulkUpdateCredit(
                                                          bulkUpdateCreditController
                                                              .getChildCubit()
                                                              .createRequestData(
                                                                  customer: state
                                                                      .selectedCustomer
                                                                      ?.id,
                                                                  truck: state
                                                                      .selectedTruck
                                                                      ?.id));
                                                  fetchTransactions(
                                                      context, state);
                                                },
                                      child: Text(
                                        "CRED",
                                        style:
                                            TextStyle(color: AppColors.white),
                                      )),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  BulkUpdatePricePopup(
                                    controller: bulkUpdatePricePopupController,
                                    allSelected: state
                                            .getTransactionsByDateTruckCustomerState
                                            ?.allSelected ??
                                        false,
                                    selectedCustomer:
                                        state.selectedCustomer?.id ?? 0,
                                    selectedTruck: state.selectedTruck?.id ?? 0,
                                    onPopupClosed: (popupData) {
                                      if (popupData.status ==
                                          BooleanStatus.success) {
                                        fetchTransactions(context, state);
                                      }
                                    },
                                  )
                                ],
                              )),
                              ValueListenableBuilder<bool>(
                                valueListenable:
                                    getCubit(context).loadingButtonNotifier,
                                builder: (context, isLoading, child) {
                                  return Container(
                                    child: TextButton(
                                        style: TextButton.styleFrom(
                                            backgroundColor: AppColors.bgPrimary,
                                            disabledBackgroundColor:
                                            AppColors.grey1,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: borderRadius.br_5),
                                            padding: edge_insets_x_24),
                                        onPressed:
                                        (state.getTransactionsByDateTruckCustomerState
                                            ?.getAllTransactionsStatus ==
                                            BooleanStatus.pending ||
                                            state.selectedCustomer ==
                                                null ||
                                            state.selectedTruck == null || isLoading)
                                            ? null
                                            : () async {
                                            getCubit(context).setLoadingButtonStatus(true);
                                            await fetchTransactions(
                                                context, state);
                                            getTransactionsByDateTruckCustomerController
                                                .getChildCubit()
                                                .toggleSelectAll(false);
                                            getCubit(context).setLoadingButtonStatus(false);
                                        },
                                        child: Container(
                                          width: 50,
                                          alignment: Alignment.center,
                                          child: isLoading
                                              ? const SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(
                                              color: AppColors.white,
                                            ),
                                          )
                                              : const Text(
                                            "Submit",
                                            style: TextStyle(color: AppColors.white),
                                          ),
                                        )),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  state.selectedCustomer != null && state.selectedTruck != null
                      ? Expanded(
                          child: SingleChildScrollView(
                          // Add SingleChildScrollView here
                          child: GetTransactionsByDateTruckCustomer(
                            customerid: state.selectedCustomer!.id!,
                            truckid: state.selectedTruck!.id!,
                            selectedCustomer: state.selectedCustomer,
                            controller:
                                getTransactionsByDateTruckCustomerController,
                            customers:
                                state.getAllCustomersResponse ?? customersData,
                            onStateChanged:
                                (getTransactionsByDateTruckCustomerState) =>
                                    getCubit(context).emitState(state.copyWith(
                                        getTransactionsByDateTruckCustomerState:
                                            getTransactionsByDateTruckCustomerState)),
                          ),
                        ))
                      : Container(
                          margin: edge_insets_t_24,
                          child: Text(
                            "select both truck and customer",
                            style: TextStyle(fontSize: Fonts.fontSize16),
                          ),
                        )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  fetchTransactions(context, state) async {
    await getTransactionsByDateTruckCustomerController
        .getChildCubit()
        .getTransactionsByDateTruckCustomer(
          getTransactionsByDateTruckCustomerController
              .getChildCubit()
              .createRequestData(
                customerid: state.selectedCustomer!.id!,
                truckid: state.selectedTruck!.id!,
              ),
        );
  }

  @override
  AdjustmentScreenCubit createCubitAndAssignToController(BuildContext context) {
    AdjustmentScreenCubit cubit = AdjustmentScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
