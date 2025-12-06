import 'package:basic/app/escale/models/customers_credit_models.dart';
import 'package:basic/app/escale/widgets/trucks_dropdown/trucks_dropdown.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../core/widgets/base_dropdown_widget.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/input_styles.dart';
import '../../models/truck_models.dart';
import '../../request_response/get_all_customers/get_all_customers_response.dart';
import '../../request_response/get_all_items/get_all_items_response.dart';
import '../customer_dropdown/customer_dropdown.dart';
import '../get_transactions_by_truck_customer/get_transactions_by_truck_customer_controller.dart';
import '../items_dropdown/items_dropdown.dart';
import '../sell_template_purchase_type/sell_template_purchase_type.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'sell_screen_lot_sale_template_controller.dart';
import 'sell_screen_lot_sale_template_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class SellScreenLotSaleTemplate
    extends BaseStatelessWidget<SellScreenLotSaleTemplateController,
        SellScreenLotSaleTemplateCubit,
        SellScreenLotSaleTemplateState> {
  final VoidCallback? onTransactionCreated;
  final VoidCallback? closeTemplate;
  final Color? color;
  List<Trucks> trucks;
  List<GetAllCustomersResponse> customers;
  List<GetAllItemsResponse> items;

  SellScreenLotSaleTemplate({Key? key, super.controller, super.onStateChanged, required this.items, required this.customers, required this.trucks, this.color, this.closeTemplate, this.onTransactionCreated})
      : super(key: key);
  // GetTransactionsByTruckCustomerController getTransactionsByTruckCustomerController = GetTransactionsByTruckCustomerController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SellScreenLotSaleTemplateCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          SellScreenLotSaleTemplateCubit,
          SellScreenLotSaleTemplateState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final cubit = getCubit(context);
          final isLargeScreen = MediaQuery.of(context).size.width > 600;
          final dropdownWidth = isLargeScreen
              ? MediaQuery.of(context).size.width * (0.45/2)
              : MediaQuery.of(context).size.width * 0.45;
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: edge_insets_t_12,
                padding: edge_insets_x_8_t_16_b_6,
                decoration: BoxDecoration(
                  color: color,
                  border: borders.b_1px_bgPrimary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TrucksDropdown(
                              width: 0.45,
                              trucks: trucks,
                              onChanged: (truck) {
                                cubit.setSelectedTruck(truck);
                              },
                            ),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: ItemsDropdown(
                              key: ValueKey(state.selectedTruck),
                              width: 0.45,
                              onChanged: (item) =>
                                  cubit.setSelectedItem(item),
                              selectedTruck: state.selectedTruck,
                              selectedItem: state.selectedItem,
                            ),
                          ),
                          // Expanded(
                          //   child: Container(
                          //     height: 40,
                          //     width: dropdownWidth,
                          //     child: BaseDropdownWidget<GetAllItemsResponse>(
                          //       items: items,
                          //       hintText: "Select Item",
                          //       width: dropdownWidth,
                          //       showSearchBox: true,
                          //       onChanged:  (item) =>
                          //           cubit.setSelectedItem(item),
                          //       itemAsString: (item) => item.name.toString(),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Container(
                      margin: edge_insets_t_4,
                      child: Row(
                        children: [
                          CustomerDropdown(
                            onChanged: (customer) {
                              cubit.setSelectedCustomer(customer);
                            },
                            width: 0.72,
                            customers: customers,
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: TextFormField(
                              initialValue:
                              state.lotSize?.toString() ??
                                  "",
                              decoration:
                              InputStyles.formTemplateInput(
                                hintText: 'bags',
                              ),
                              keyboardType:
                              TextInputType.number,
                              onChanged: (value) =>
                                  cubit.setLotSize(
                                      int.tryParse(value)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: edge_insets_t_4,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: isLargeScreen
                                ? MediaQuery.sizeOf(context).width *
                                0.15
                                : MediaQuery.sizeOf(context).width *
                                0.3,
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    // key: ValueKey(state.selectedItem),
                                    // initialValue: state.selectedItem != null
                                    //     ? selectedPrice = items.firstWhere(
                                    //       (item) => item.name?.trim().toLowerCase() == state.selectedItem?.trim().toLowerCase(),
                                    //   orElse: () => GetAllItemsResponse(id: 0, name: '', price: '0'),
                                    // ).price
                                    //     : "",
                                    decoration: InputStyles.formTemplateInput(
                                      hintText: 'Amount',
                                    ),
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) => cubit.setConstPrice(double.parse(value)),
                                  ),
                                ),
                                SizedBox(width: 5),
                              ],
                            ),
                          ),
                          SizedBox(width: 5),
                          Flexible(
                              child: Wrap(
                                spacing: 8,
                                runSpacing: 4,
                                alignment: WrapAlignment.end,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  SellTemplatePurchaseType(
                                    onPurchaseTypeChange: (purchaseType) =>
                                        cubit.setPurchaseType(purchaseType),
                                    purchaseType: state.purchaseType,
                                  ),
                                  Container(
                                    height: 35,
                                    child: ElevatedButton(
                                      style: TextButton.styleFrom(
                                          backgroundColor:
                                          AppColors.bgPrimary,
                                          disabledBackgroundColor: AppColors.grey1,
                                          elevation: 2,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              borderRadius.br_5),
                                          padding: edge_insets_x_24),
                                      onPressed: (getCubit(context).validateForm() == false || state.loadingButton!)
                                          ? null
                                          : () async {
                                        getCubit(context).setLoadingButtonStatus(true);
                                        await cubit.createTransaction(
                                            cubit.createRequestData());
                                        onTransactionCreated?.call();
                                        getCubit(context).setLoadingButtonStatus(false);
                                      },
                                      child: Container(
                                        width: 50,
                                        alignment: Alignment.center,
                                        child: state.loadingButton!
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
                                      ),
                                    ),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                  onTap: () {
                    closeTemplate?.call();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: borderRadius.br_100,
                        color: AppColors.white09),
                    child: Icon(
                      Icons.cancel_outlined,
                      color: AppColors.bgPrimary,
                    ),
                  ))
            ],
          );
        },
      ),
    );
  }

  @override
  SellScreenLotSaleTemplateCubit createCubitAndAssignToController(
      BuildContext context) {
    SellScreenLotSaleTemplateCubit cubit = SellScreenLotSaleTemplateCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
