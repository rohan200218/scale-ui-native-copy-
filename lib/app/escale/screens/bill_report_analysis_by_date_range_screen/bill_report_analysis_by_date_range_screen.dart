import 'package:basic/app/escale/widgets/get_collections_by_date_range/get_collections_by_date_range.dart';
import 'package:basic/app/escale/widgets/get_collections_by_date_range/get_collections_by_date_range_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/date_time/app_date_time_utils.dart';
import '../../../themes/fonts.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'bill_report_analysis_by_date_range_screen_controller.dart';
import 'bill_report_analysis_by_date_range_screen_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class BillReportAnalysisByDateRangeScreen extends BaseStatelessWidget<
    BillReportAnalysisByDateRangeScreenController,
    BillReportAnalysisByDateRangeScreenCubit,
    BillReportAnalysisByDateRangeScreenState> {
  BillReportAnalysisByDateRangeScreen(
      {Key? key, super.controller, super.onStateChanged})
      : super(key: key);
  GetCollectionsByDateRangeController getCollectionsByDateRangeController =
      GetCollectionsByDateRangeController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BillReportAnalysisByDateRangeScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<BillReportAnalysisByDateRangeScreenCubit,
          BillReportAnalysisByDateRangeScreenState>(
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
                  SizedBox(height: 10),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              DateTime? pickedStartDate = await showDatePicker(
                                context: context,
                                initialDate: state.startDate,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              );
                              if (pickedStartDate != null && pickedStartDate != state.startDate) {
                                getCubit(context).emitState(state.copyWith(startDate: pickedStartDate));
                                await getCollectionsByDateRangeController
                                    .getChildCubit()
                                    .getCollectionsByDateRange(
                                  getCollectionsByDateRangeController
                                      .getChildCubit()
                                      .createRequestData(),
                                );
                              }
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    "Start Date",
                                    style: TextStyle(
                                        fontWeight: Fonts.f500, fontSize: Fonts.fontSize16),
                                  ),
                                ),
                                SizedBox(height: 6,),
                                Container(
                                  padding: edge_insets_x_12_y_8,
                                  decoration: BoxDecoration(
                                      border: borders.b_1px_grey4,
                                      borderRadius: borderRadius.br_5
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${AppDateTimeUtils.getDateFormat(state.startDate  ?? DateTime.now())}",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Icon(Icons.calendar_month, size: 20),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              DateTime? pickedEndDate = await showDatePicker(
                                context: context,
                                initialDate: state.endDate,
                                firstDate: state.startDate ?? DateTime.now(),
                                lastDate: DateTime(2100),
                              );
                              if (pickedEndDate != null && pickedEndDate != state.endDate) {
                                getCubit(context).emitState(state.copyWith(endDate: pickedEndDate));
                                await getCollectionsByDateRangeController
                                    .getChildCubit()
                                    .getCollectionsByDateRange(
                                  getCollectionsByDateRangeController
                                      .getChildCubit()
                                      .createRequestData(),
                                );
                              }
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    "End Date",
                                    style: TextStyle(
                                        fontWeight: Fonts.f500, fontSize: Fonts.fontSize16),
                                  ),
                                ),
                                SizedBox(height: 6,),
                                Container(
                                  padding: edge_insets_x_12_y_8,
                                  decoration: BoxDecoration(
                                      border: borders.b_1px_grey4,
                                      borderRadius: borderRadius.br_5
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${AppDateTimeUtils.getDateFormat(state.endDate ?? DateTime.now())}",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Icon(Icons.calendar_month, size: 20),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  GetCollectionsByDateRange(
                    key: ValueKey("${state.startDate}_${state.endDate}"),
                    controller: getCollectionsByDateRangeController,
                    startDate: AppDateTimeUtils.getDateFormatReverse(state.startDate!),
                    endDate: AppDateTimeUtils.getDateFormatReverse(state.endDate!),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  BillReportAnalysisByDateRangeScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    BillReportAnalysisByDateRangeScreenCubit cubit =
        BillReportAnalysisByDateRangeScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
