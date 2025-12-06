import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_month_picker/flutter_custom_month_picker.dart';
import '../../../core/utils/date_time/app_date_time_utils.dart';
import '../../../themes/fonts.dart';
import '../../widgets/get_collections_by_month/get_collections_by_month.dart';
import '../../widgets/get_collections_by_month/get_collections_by_month_controller.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'bill_report_analysis_by_month_screen_controller.dart';
import 'bill_report_analysis_by_month_screen_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class BillReportAnalysisByMonthScreen
    extends BaseStatelessWidget<BillReportAnalysisByMonthScreenController,
        BillReportAnalysisByMonthScreenCubit,
        BillReportAnalysisByMonthScreenState> {
  BillReportAnalysisByMonthScreen(
      {Key? key, super.controller, super.onStateChanged})
      : super(key: key);
  GetCollectionsByMonthController getCollectionsByMonthController =
  GetCollectionsByMonthController();
  DateTime selectedMonth = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BillReportAnalysisByMonthScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          BillReportAnalysisByMonthScreenCubit,
          BillReportAnalysisByMonthScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return SingleChildScrollView(
            child: Container(
              padding: edge_insets_10,
              child: Column(
                children: [
                  Container(
                    child: Text(
                      "Total Collections by Month",
                      style: TextStyle(
                          fontWeight: Fonts.f500, fontSize: Fonts.fontSize16),
                    ),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () async {
                      showMonthPicker(
                        context,
                        onSelected: (month, year) {
                          // Update state with the selected month and year
                          getCubit(context)
                              .emitState(state.copyWith(selectedMonth: month, selectedYear: year));
                          getCollectionsByMonthController
                              .getChildCubit()
                              .getCollectionsByMonth(getCollectionsByMonthController
                              .getChildCubit()
                              .createRequestData());
                        },
                        initialSelectedMonth: state.selectedMonth,
                        initialSelectedYear: state.selectedYear,
                        firstYear: 2000,
                        lastYear: 2040,
                        firstEnabledMonth: 1,
                        lastEnabledMonth: 12,
                        selectButtonText: 'OK',
                        cancelButtonText: 'Cancel',
                        highlightColor: Colors.purple,
                        textColor: Colors.black,
                        contentBackgroundColor: Colors.white,
                        dialogBackgroundColor: Colors.grey[200],
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${AppDateTimeUtils.getMonthName(state.selectedMonth!)} ${state.selectedYear}",
                            style: TextStyle(fontSize: 16),
                          ),
                          Icon(Icons.calendar_today, size: 20),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GetCollectionsByMonth(
                    key: ValueKey("${state.selectedYear}_${state.selectedMonth}"),
                    controller: getCollectionsByMonthController,
                    year: state.selectedYear!,
                    month: state.selectedMonth!,
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
  BillReportAnalysisByMonthScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    BillReportAnalysisByMonthScreenCubit cubit =
    BillReportAnalysisByMonthScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}

