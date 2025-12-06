import 'package:basic/app/escale/request_response/get_all_customers/get_all_customers_response.dart';
import 'package:basic/app/escale/request_response/get_all_items/get_all_items_response.dart';
import 'package:basic/app/escale/request_response/get_all_trucks/get_all_trucks_response.dart';
import 'package:basic/app/escale/widgets/get_all_Items/get_all_Items.dart';
import 'package:basic/app/escale/widgets/get_all_Items/get_all_Items_controller.dart';
import 'package:basic/app/escale/widgets/get_all_customers/get_all_customers.dart';
import 'package:basic/app/escale/widgets/get_all_customers/get_all_customers_controller.dart';
import 'package:basic/app/escale/widgets/get_all_trucks/get_all_trucks.dart';
import 'package:basic/app/escale/widgets/get_all_trucks/get_all_trucks_controller.dart';
import 'package:basic/app/escale/widgets/get_recent_transactions/get_recent_transactions.dart';
import 'package:basic/app/escale/widgets/get_recent_transactions/get_recent_transactions_controller.dart';
import 'package:basic/app/escale/widgets/sell_screen_lot_sale_template/sell_screen_lot_sale_template.dart';
import 'package:basic/app/escale/widgets/sell_screen_lot_sale_template/sell_screen_lot_sale_template_controller.dart';
import 'package:basic/app/escale/widgets/sell_screen_template/sell_screen_template.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../core/database/boolean_status.dart';
import '../../../core/services/usb_serial.dart';
import '../../../core/widgets/app_scaffold.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/shadows.dart';
import '../../widgets/get_all_transactions/get_all_transactions.dart';
import '../../widgets/get_all_transactions/get_all_transactions_controller.dart';
import '../../widgets/sell_screen_template/sell_screen_template_controller.dart';
import '../bluetooth_printer_screen/bluetooth_printer_screen.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'sell_screen_new_controller.dart';
import 'sell_screen_new_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class SellScreenNew extends BaseStatelessWidget<SellScreenNewController,
    SellScreenNewCubit, SellScreenNewState> {
  SellScreenNew({Key? key, super.controller, super.onStateChanged})
      : super(key: key);
  GetRecentTransactionsController getRecentTransactionsController =
  GetRecentTransactionsController();
  final List<SellScreenTemplateController> sellScreenTemplateControllers = [];
  final Map<SellScreenTemplateController, Color> controllerColors = {};
  final List<SellScreenLotSaleTemplateController> sellScreenLotSaleTemplateControllers = [];
  final Map<SellScreenLotSaleTemplateController, Color> lotControllerColors = {};
  GetAllTrucksController getAllTrucksController = GetAllTrucksController();
  GetAllCustomersController getAllCustomersController =
  GetAllCustomersController();
  GetAllItemsController getAllItemsController = GetAllItemsController();
  late List<GetAllTrucksResponse> trucksData = [];
  late List<GetAllCustomersResponse> customersData =[];
  late List<GetAllItemsResponse> itemsData = [];
  @override
  Widget build(BuildContext context) {
    if (sellScreenTemplateControllers.isEmpty) {
      _addNewControllerWithColor();
      _addNewControllerWithColor();
    }
    if (sellScreenLotSaleTemplateControllers.isEmpty) {
      _addNewLotControllerWithColor();
      _addNewLotControllerWithColor();
    }

    return BlocProvider<SellScreenNewCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<SellScreenNewCubit, SellScreenNewState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final largeScreen = MediaQuery.sizeOf(context).width > 600;
          return AppScaffold(
            appBarTitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Text("Sell"),
                Container(
                  width: largeScreen
                      ? MediaQuery.sizeOf(context).width / 7
                      : MediaQuery.sizeOf(context).width /4,
                  child: Row(
                    children: [
                      ValueListenableBuilder(
                        valueListenable: usbSerialService.statusNotifier,
                        builder: (context, status, child) => IconButton(
                          onPressed: () {
                            status == "Connected"
                                ? disconnectUsbSerial()
                                : connectUsbSerial();
                          },
                          style: IconButton.styleFrom(
                              side: BorderSide(
                                  color: status == "Connected"
                                      ? AppColors.green
                                      : AppColors.grey1,
                                  width: 2)),
                          icon: status == "Connected"
                              ? Icon(
                            Icons.usb,
                            color: AppColors.green,
                          )
                              : Icon(
                            Icons.usb_off_outlined,
                            color: AppColors.grey1,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: state.printerConnectionStatus == BooleanStatus.pending
                            ? () async {
                          await getCubit(context).printerConnectionStatus();
                        }
                            : () async {
                          // If the connection status is not pending, disconnect the printer
                           getCubit(context).disconnect();
                        },
                        style: IconButton.styleFrom(
                          side: BorderSide(
                            color: state.printerConnectionStatus == BooleanStatus.pending
                                ? AppColors.grey1
                                : AppColors.green,
                            width: 2,
                          ),
                        ),
                        icon: state.printerConnectionStatus == BooleanStatus.pending
                            ? Icon(
                          Icons.print_disabled_outlined,
                          color: AppColors.grey1,
                        )
                            : Icon(
                          Icons.print_outlined,
                          color: AppColors.green,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                margin: edge_insets_b_8,
                child: Column(
                  children: [
                    GetRecentTransactions(
                      controller: getRecentTransactionsController,
                      customers: state.getAllCustomersResponse ?? customersData,
                      onStateChanged: (getRecentTransactionsState) =>
                          getCubit(context).emitState(state.copyWith(
                              getRecentTransactionsState: getRecentTransactionsState)),
                    ),
                    GetAllCustomersNoTemplate(
                      controller: getAllCustomersController,
                      onCustomersLoaded: (customers) {
                        customersData = customers;
                        getCubit(context).emitState(state.copyWith(getAllCustomersResponse: customers));
                      },
                    ),
                    GetAllTrucksNoTemplate(
                      controller:getAllTrucksController,
                      onTrucksFetched: (trucks){
                        trucksData = trucks;
                        getCubit(context).emitState(state.copyWith(getAllTrucksResponse: trucks));
                      },
                    ),
                    GetAllItems(
                      controller: getAllItemsController,
                      onItemsFetched: (items){
                        itemsData = items;
                        getCubit(context).emitState(state.copyWith(getAllItemsResponse: items));
                      },
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 45,
                      margin: edge_insets_r_8,
                      alignment: largeScreen ? Alignment.center :Alignment.centerRight,
                      child: ToggleButtons(
                        constraints: BoxConstraints(minHeight: 45),
                        borderColor: AppColors.grey4,
                        borderRadius: borderRadius.br_10,
                        selectedBorderColor: AppColors.bgPrimary2,
                        isSelected: [
                          !state.lotSale,
                          state.lotSale
                        ],
                        onPressed: (index) {
                          bool lotSale = index == 1;
                          getCubit(context).emitState(
                            state.copyWith(
                              lotSale: lotSale,
                            ),
                          );
                        },
                        selectedColor: AppColors.bgPrimary,
                        color: AppColors.textHeading,
                        children: [
                          Container(
                            padding: edge_insets_x_30,
                            child: Text('Weight'),
                          ),
                          Container(
                            padding: edge_insets_x_30,
                            child: Text('Lot Sale'),
                          ),
                        ],
                      ),
                    ),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        int columns = constraints.maxWidth > 600 ? 2 : 1;

                        return !state.lotSale
                            ? Wrap(
                          spacing: 12,
                          runSpacing: 10,
                          children: sellScreenTemplateControllers
                              .asMap()
                              .entries
                              .map((entry) {
                            int index = entry.key;
                            SellScreenTemplateController controller = entry.value;

                            return Container(
                              width: constraints.maxWidth / columns - 12,
                              child: SellScreenTemplate(
                                key: ValueKey(controller),
                                customers: state.getAllCustomersResponse ?? customersData,
                                trucks: state.getAllTrucksResponse ?? trucksData,
                                items: state.getAllItemsResponse ?? itemsData,
                                controller: controller,
                                printerConnectionStatus: state.printerConnectionStatus,
                                closeTemplate: () {
                                  sellScreenTemplateControllers
                                      .remove(controller);
                                  controllerColors
                                      .remove(controller); // Remove color mapping
                                  (context as Element).markNeedsBuild();
                                },
                                onTransactionCreated: () async {
                                  await getRecentTransactionsController
                                      .getChildCubit()
                                      .getRecentTransactions(
                                      getRecentTransactionsController
                                          .getChildCubit()
                                          .createRequestData());
                                  (context as Element).markNeedsBuild();
                                },
                                color: controllerColors[controller]!,
                                // Retrieve color from map
                                onStateChanged: (sellScreenTemplateState) =>
                                    getCubit(context).emitState(state.copyWith(
                                        sellScreenTemplateState:
                                        sellScreenTemplateState)),
                              ),
                            );
                          }).toList(),
                        )
                            : Wrap(
                          spacing: 12,
                          runSpacing: 10,
                          children: sellScreenLotSaleTemplateControllers
                              .asMap()
                              .entries
                              .map((entry) {
                            int index = entry.key;
                            SellScreenLotSaleTemplateController lotController = entry.value;

                            return Container(
                              width: constraints.maxWidth / columns - 12,
                              child: SellScreenLotSaleTemplate(
                                key: ValueKey(lotController),
                                customers: state.getAllCustomersResponse ?? customersData,
                                items: state.getAllItemsResponse ?? itemsData,
                                trucks: state.getAllTrucksResponse ?? trucksData,
                                controller: lotController,
                                color: lotControllerColors[lotController],
                                closeTemplate: () {
                                  sellScreenLotSaleTemplateControllers
                                      .remove(lotController);
                                  lotControllerColors
                                      .remove(lotController); // Remove color mapping
                                  (context as Element).markNeedsBuild();
                                },
                                onTransactionCreated: () async {
                                  await getRecentTransactionsController
                                      .getChildCubit()
                                      .getRecentTransactions(
                                      getRecentTransactionsController
                                          .getChildCubit()
                                          .createRequestData());
                                  (context as Element).markNeedsBuild();
                                },
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: Container(
              decoration: BoxDecoration(
                  boxShadow: const [shadows.bs_primary],
                  borderRadius: borderRadius.br_30
              ),
              margin: edge_insets_y_24,
              child: IconButton(
                padding: edge_insets_16,
                style: IconButton.styleFrom(backgroundColor: AppColors.bgPrimary2),
                color: AppColors.white,
                onPressed: () {
                  !state.lotSale
                      ? _addNewControllerWithColor()
                      : _addNewLotControllerWithColor();
                  (context as Element).markNeedsBuild();
                },
                icon: Icon(Icons.add, size: 28,),
              ),
            ),
          );
        },
      ),
    );
  }

  void _addNewControllerWithColor() {
    var newController = SellScreenTemplateController();
    Color assignedColor = AppColors.formTemplateColors[
    sellScreenTemplateControllers.length %
        AppColors.formTemplateColors.length];
    sellScreenTemplateControllers.add(newController);
    controllerColors[newController] = assignedColor;
  }

  void _addNewLotControllerWithColor() {
    var newLotController = SellScreenLotSaleTemplateController();
    Color assignedColor = AppColors.formTemplateColors[
    sellScreenLotSaleTemplateControllers.length %
        AppColors.formTemplateColors.length];
    sellScreenLotSaleTemplateControllers.add(newLotController);
    lotControllerColors[newLotController] = assignedColor;
  }


  @override
  SellScreenNewCubit createCubitAndAssignToController(BuildContext context) {
    SellScreenNewCubit cubit = SellScreenNewCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
