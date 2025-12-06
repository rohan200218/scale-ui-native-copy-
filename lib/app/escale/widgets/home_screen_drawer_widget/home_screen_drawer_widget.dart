import 'package:basic/app/escale/screens/sell_list.dart';
import 'package:basic/app/themes/borders.dart';
import 'package:basic/app/themes/buttons.dart';
import 'package:basic/app/themes/shadows.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:basic/app/themes/app_colors.dart';
import 'package:basic/app/themes/edge_insets.dart';
import 'package:basic/app/themes/fonts.dart';

import '../../request_response/get_all_customers/get_all_customers_response.dart';
import '../../request_response/get_all_items/get_all_items_response.dart';
import '../../request_response/get_all_trucks/get_all_trucks_response.dart';
import '../get_all_Items/get_all_Items.dart';
import '../get_all_Items/get_all_Items_controller.dart';
import '../get_all_customers/get_all_customers.dart';
import '../get_all_customers/get_all_customers_controller.dart';
import '../get_all_trucks/get_all_trucks.dart';
import '../get_all_trucks/get_all_trucks_controller.dart';
import 'home_screen_drawer_widget_controller.dart';
import 'home_screen_drawer_widget_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class HomeScreenDrawerWidget extends BaseStatelessWidget<
    HomeScreenDrawerWidgetController,
    HomeScreenDrawerWidgetCubit,
    HomeScreenDrawerWidgetState> {
  HomeScreenDrawerWidget({Key? key, super.controller, super.onStateChanged})
      : super(key: key);
  GetAllTrucksController getAllTrucksController = GetAllTrucksController();
  GetAllCustomersController getAllCustomersController =
  GetAllCustomersController();
  GetAllItemsController getAllItemsController = GetAllItemsController();
  late List<GetAllTrucksResponse> trucksData = [];
  late List<GetAllCustomersResponse> customersData =[];
  late List<GetAllItemsResponse> itemsData = [];


  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeScreenDrawerWidgetCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<HomeScreenDrawerWidgetCubit,
          HomeScreenDrawerWidgetState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final largeScreen = MediaQuery.sizeOf(context).width > 600;
          final landScape = MediaQuery.of(context).orientation == Orientation.landscape;
          return Drawer(
            shape: const RoundedRectangleBorder(),
            backgroundColor: AppColors.bgLightBlue,
            // surfaceTintColor: AppColors.white,
            width: largeScreen
                ? 300
                : MediaQuery.sizeOf(context).width / 1.3,
            child: SingleChildScrollView(
              child: Container(
                height: landScape? null : MediaQuery.sizeOf(context).height,
                margin: edge_insets_x_16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: edge_insets_t_16,
                          margin: edge_insets_y_16,
                          child: IconButton(
                            style: IconButton.styleFrom(
                                backgroundColor: AppColors.grey2),
                            onPressed: () {
                              context.pop();
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: AppColors.textHeading,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          decoration:
                          const BoxDecoration(boxShadow: [shadows.bs_grey]),
                          child: Row(
                            children: [
                              Expanded(
                                  child: TextButton(
                                    style: Buttons.sideMenuButton,
                                    onPressed: () {
                                      context.go('/home');
                                    },
                                    child: const Row(
                                      children: [
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Icon(
                                          Icons.home_sharp,
                                          color: AppColors.textHeading,
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Text(
                                          "Home",
                                          style: TextStyle(
                                              color: AppColors.textHeading,
                                              fontSize: Fonts.fontSize16,
                                              fontWeight: Fonts.f400),
                                        )
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          decoration:
                          const BoxDecoration(boxShadow: [shadows.bs_grey]),
                          child: Row(
                            children: [
                              Expanded(
                                  child: TextButton(
                                    style: Buttons.sideMenuButton,
                                    onPressed: () {
                                      context.go('/receive');
                                    },
                                    child: const Row(
                                      children: [
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Icon(
                                          Icons.fire_truck,
                                          color: AppColors.textHeading,
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Text(
                                          "Receive",
                                          style: TextStyle(
                                              color: AppColors.textHeading,
                                              fontSize: Fonts.fontSize16,
                                              fontWeight: Fonts.f400),
                                        )
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          decoration:
                          const BoxDecoration(boxShadow: [shadows.bs_grey]),
                          child: Row(
                            children: [
                              Expanded(
                                  child: TextButton(
                                    style: Buttons.sideMenuButton,
                                    onPressed: () {
                                      context.go('/sell');
                                    },
                                    child: const Row(
                                      children: [
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Icon(
                                          Icons.shopping_cart_checkout_outlined,
                                          color: AppColors.textHeading,
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Text(
                                          "Sell",
                                          style: TextStyle(
                                              color: AppColors.textHeading,
                                              fontSize: Fonts.fontSize16,
                                              fontWeight: Fonts.f400),
                                        )
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          decoration:
                          const BoxDecoration(boxShadow: [shadows.bs_grey]),
                          child: Row(
                            children: [
                              Expanded(
                                  child: TextButton(
                                    style: Buttons.sideMenuButton,
                                    onPressed: () {
                                      context.go('/adjustments');
                                    },
                                    child: const Row(
                                      children: [
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Icon(
                                          Icons.money,
                                          color: AppColors.textHeading,
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Text(
                                          "Adjustments",
                                          style: TextStyle(
                                              color: AppColors.textHeading,
                                              fontSize: Fonts.fontSize16,
                                              fontWeight: Fonts.f400),
                                        )
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   height: 16,
                        // ),
                        // Container(
                        //   decoration:
                        //   const BoxDecoration(boxShadow: [shadows.bs_grey]),
                        //   child: Row(
                        //     children: [
                        //       Expanded(
                        //           child: TextButton(
                        //             style: Buttons.sideMenuButton,
                        //             onPressed: () {
                        //               context.go('/settings');
                        //             },
                        //             child: const Row(
                        //               children: [
                        //                 SizedBox(
                        //                   width: 16,
                        //                 ),
                        //                 Icon(
                        //                   Icons.settings,
                        //                   color: AppColors.textHeading,
                        //                 ),
                        //                 SizedBox(
                        //                   width: 16,
                        //                 ),
                        //                 Text(
                        //                   "Settings",
                        //                   style: TextStyle(
                        //                       color: AppColors.textHeading,
                        //                       fontSize: Fonts.fontSize16,
                        //                       fontWeight: Fonts.f400),
                        //                 )
                        //               ],
                        //             ),
                        //           ))
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                          height: 16,
                        ),
                        // Container(
                        //   decoration:
                        //   const BoxDecoration(boxShadow: [shadows.bs_grey]),
                        //   child: Row(
                        //     children: [
                        //       Expanded(
                        //           child: TextButton(
                        //             style: Buttons.sideMenuButton,
                        //             onPressed: () {
                        //               context.go('/bill');
                        //             },
                        //             child: const Row(
                        //               children: [
                        //                 SizedBox(
                        //                   width: 16,
                        //                 ),
                        //                 Icon(
                        //                   Icons.collections_bookmark_outlined,
                        //                   color: AppColors.textHeading,
                        //                 ),
                        //                 SizedBox(
                        //                   width: 16,
                        //                 ),
                        //                 Text(
                        //                   "Bill Collection",
                        //                   style: TextStyle(
                        //                       color: AppColors.textHeading,
                        //                       fontSize: Fonts.fontSize16,
                        //                       fontWeight: Fonts.f400),
                        //                 )
                        //               ],
                        //             ),
                        //           ))
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 16,
                        // ),
                        // Container(
                        //   decoration:
                        //   const BoxDecoration(boxShadow: [shadows.bs_grey]),
                        //   child: Row(
                        //     children: [
                        //       Expanded(
                        //           child: TextButton(
                        //             style: Buttons.sideMenuButton,
                        //             onPressed: () {
                        //               context.go('/bill-statements');
                        //             },
                        //             child: const Row(
                        //               children: [
                        //                 SizedBox(
                        //                   width: 16,
                        //                 ),
                        //                 Icon(
                        //                   Icons.currency_rupee,
                        //                   color: AppColors.textHeading,
                        //                 ),
                        //                 SizedBox(
                        //                   width: 16,
                        //                 ),
                        //                 Text(
                        //                   "Bill Statements",
                        //                   style: TextStyle(
                        //                       color: AppColors.textHeading,
                        //                       fontSize: Fonts.fontSize16,
                        //                       fontWeight: Fonts.f400),
                        //                 )
                        //               ],
                        //             ),
                        //           ))
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 16,
                        // ),
                        // Container(
                        //   decoration:
                        //   const BoxDecoration(boxShadow: [shadows.bs_grey]),
                        //   child: Row(
                        //     children: [
                        //       Expanded(
                        //           child: TextButton(
                        //             style: Buttons.sideMenuButton,
                        //             onPressed: () {
                        //               context.go('/bill-analysis');
                        //             },
                        //             child: const Row(
                        //               children: [
                        //                 SizedBox(
                        //                   width: 16,
                        //                 ),
                        //                 Icon(
                        //                   Icons.analytics,
                        //                   color: AppColors.textHeading,
                        //                 ),
                        //                 SizedBox(
                        //                   width: 16,
                        //                 ),
                        //                 Text(
                        //                   "Reports & Analysis",
                        //                   style: TextStyle(
                        //                       color: AppColors.textHeading,
                        //                       fontSize: Fonts.fontSize16,
                        //                       fontWeight: Fonts.f400),
                        //                 )
                        //               ],
                        //             ),
                        //           ))
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            margin: edge_insets_b_16,
                            decoration: const BoxDecoration(boxShadow: [shadows.bs_grey]),
                            child: Row(
                              children: [
                                Expanded(
                                    child: TextButton(
                                      style: Buttons.sideMenuButton,
                                      onPressed: () {
                                        getCubit(context).logout();
                                        context.go('/welcome');
                                      },
                                      child: const Row(
                                        children: [
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Icon(
                                            Icons.logout,
                                            color: AppColors.textHeading,
                                          ),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Text(
                                            "Logout",
                                            style: TextStyle(
                                                color: AppColors.textHeading,
                                                fontSize: Fonts.fontSize16,
                                                fontWeight: Fonts.f400),
                                          )
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          Container(
                            padding: edge_insets_b_16,
                            alignment: Alignment.center,
                            child: Text("version: 23.11.24", style: TextStyle(
                              fontSize: Fonts.fontSize16,
                              fontWeight: Fonts.f500,
                            ),),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  HomeScreenDrawerWidgetCubit createCubitAndAssignToController(
      BuildContext context) {
    HomeScreenDrawerWidgetCubit cubit =
        HomeScreenDrawerWidgetCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
