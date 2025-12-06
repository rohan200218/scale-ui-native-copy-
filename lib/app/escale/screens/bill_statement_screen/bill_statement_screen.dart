import 'package:basic/app/core/widgets/app_scaffold.dart';
import 'package:basic/app/escale/widgets/get_all_return_transactions/get_all_return_transactions.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'bill_statement_screen_controller.dart';
import 'bill_statement_screen_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class BillStatementScreen
    extends BaseStatelessWidget<BillStatementScreenController,
        BillStatementScreenCubit,
        BillStatementScreenState> {
  BillStatementScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);
  final TextEditingController searchController = TextEditingController();
  final ValueNotifier<String> searchQuery = ValueNotifier<String>("");

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BillStatementScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<BillStatementScreenCubit, BillStatementScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final isLargeScreen = MediaQuery.of(context).size.width > 600;
          return AppScaffold(
            appBarTitle: Text("Bill Statements"),
            body: Container(
              padding: edge_insets_10,
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                children: [
                  Container(
                    padding: edge_insets_b_8,
                    width: isLargeScreen ? MediaQuery.sizeOf(context).width/2 : null,
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
                        if (value.isEmpty) {
                          FocusScope.of(context)
                              .unfocus();
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: ValueListenableBuilder<String>(
                      valueListenable: searchQuery,
                      builder: (context, query, _) {
                        return SingleChildScrollView(
                          child: GetAllReturnTransactions(
                            filterQuery: query,
                          ),
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
  BillStatementScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    BillStatementScreenCubit cubit = BillStatementScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
