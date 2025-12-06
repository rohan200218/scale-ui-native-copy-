import 'package:basic/app/core/utils/date_time/app_date_time_utils.dart';
import 'package:basic/app/core/widgets/app_scaffold.dart';
import 'package:basic/app/escale/widgets/get_all_customers_credit_report/get_all_customers_credit_report.dart';
import 'package:basic/app/escale/widgets/get_transactions_by_date/get_transactions_by_date.dart';
import 'package:basic/app/themes/app_colors.dart';
import 'package:basic/app/themes/shadows.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'bill_collection_screen_controller.dart';
import 'bill_collection_screen_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class BillCollectionScreen
    extends BaseStatelessWidget<BillCollectionScreenController,
        BillCollectionScreenCubit,
        BillCollectionScreenState> {
  BillCollectionScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  final TextEditingController searchController = TextEditingController();
  final ValueNotifier<String> searchQuery = ValueNotifier<String>("");
  final ValueNotifier<String> selectedSortOption = ValueNotifier<String>("0"); // Default sorting option

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BillCollectionScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<BillCollectionScreenCubit, BillCollectionScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return AppScaffold(
            appBarTitle: Text("Bill Collection"),
            body: Container(
              padding: edge_insets_10,
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Search Input Field
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                            padding: edge_insets_b_8,
                            child: TextField(
                              controller: searchController,
                              decoration: InputDecoration(
                                hintText: "Search by customer name",
                                prefixIcon: const Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(),
                                ),
                              ),
                              onChanged: (value) {
                                searchQuery.value = value.trim();
                              },
                            ),
                          )
                      ),
                      SizedBox(width: 20,),
                      // Dropdown for Sorting Options
                      Container(
                        padding: edge_insets_b_8,
                        child: ValueListenableBuilder<String>(
                          valueListenable: selectedSortOption,
                          builder: (context, selectedSort, _) {
                            return IconButton(
                              padding: edge_insets_16,
                              style: IconButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.black),
                                  borderRadius: borderRadius.br_6
                                ),
                              ),
                              icon: Icon(Icons.filter_list), // Filter icon
                              onPressed: () async {
                                final String? selectedValue = await showMenu<String>(
                                  context: context,
                                  constraints: BoxConstraints(maxWidth: 150),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: borderRadius.br_5,
                                    side: BorderSide(color: AppColors.bgPrimary, width: 2)
                                  ),
                                  position: RelativeRect.fromLTRB(
                                      MediaQuery.of(context).size.width - 120,
                                      150,
                                      0,
                                      0),
                                  menuPadding: edge_insets_0,
                                  items: [
                                    PopupMenuItem<String>(
                                      height: 40,
                                      value: "0",
                                      child: Center(child: Text("Default"),),
                                    ),
                                    PopupMenuDivider(),
                                    PopupMenuItem<String>(
                                      height: 30,
                                      value: "1",
                                      child: Center(
                                        child: Text("Highest Amount", textAlign: TextAlign.center,),
                                      ),
                                    ),
                                    PopupMenuDivider(),
                                    PopupMenuItem<String>(
                                      height: 40,
                                      value: "2",
                                      child: Center(child: Text("Due Date"),),
                                    ),
                                  ],
                                );
                                if (selectedValue != null) {
                                  selectedSortOption.value = selectedValue;
                                }
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  // Display Customer Credit Report
                  Expanded(
                    child: ValueListenableBuilder<String>(
                      valueListenable: searchQuery,
                      builder: (context, query, _) {
                        return ValueListenableBuilder<String>(
                          valueListenable: selectedSortOption,
                          builder: (context, sortOption, _) {
                            return SingleChildScrollView(
                              child: GetAllCustomersCreditReport(
                                filterQuery: query,
                                sortOption: sortOption,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  BillCollectionScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    BillCollectionScreenCubit cubit = BillCollectionScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
