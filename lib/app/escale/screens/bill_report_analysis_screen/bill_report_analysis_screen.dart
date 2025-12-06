import 'package:basic/app/core/utils/date_time/app_date_time_utils.dart';
import 'package:basic/app/core/widgets/app_scaffold.dart';
import 'package:basic/app/escale/screens/bill_report_analysis_by_date_range_screen/bill_report_analysis_by_date_range_screen.dart';
import 'package:basic/app/escale/screens/bill_report_analysis_by_month_screen/bill_report_analysis_by_month_screen.dart';
import 'package:basic/app/escale/widgets/get_collections_by_date/get_collections_by_date.dart';
import 'package:basic/app/escale/widgets/get_collections_by_date/get_collections_by_date_controller.dart';
import 'package:basic/app/themes/fonts.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../themes/app_colors.dart';
import '../bill_report_analysis_by_date_screen/bill_report_analysis_by_date_screen.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'bill_report_analysis_screen_controller.dart';
import 'bill_report_analysis_screen_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class BillReportAnalysisScreen extends BaseStatelessWidget<
    BillReportAnalysisScreenController,
    BillReportAnalysisScreenCubit,
    BillReportAnalysisScreenState> {
  BillReportAnalysisScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);
  GetCollectionsByDateController getCollectionsByDateController =
      GetCollectionsByDateController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider<BillReportAnalysisScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<BillReportAnalysisScreenCubit,
          BillReportAnalysisScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return DefaultTabController(
              length: 3,
              initialIndex: 1,
              child: AppScaffold(
                appBarTitle: Text("Reports & Analysis"),
                bottom: TabBar(
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 0,
                    indicatorColor: AppColors.bgLightBlue,
                    indicator: BoxDecoration(
                        color: AppColors.truck1,
                        border: borders.b_2px_bgPrimary,
                        borderRadius: borderRadius.br_10
                    ),
                    labelColor: AppColors.bgPrimary2,
                    unselectedLabelColor: AppColors.textHeading,
                    tabAlignment: TabAlignment.center,
                    padding: edge_insets_0,
                    tabs: <Widget>[
                      Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: 45,
                          alignment: Alignment.center,
                          child: const Text(
                            "By date",
                            style: TextStyle(
                              // color: AppColors.grey3,
                                fontWeight: Fonts.f600,
                                fontSize: Fonts.fontSize16),
                          )),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: 45,
                          alignment: Alignment.center,
                          child: const Text(
                            "By Month",
                            style: TextStyle(
                              // color: AppColors.grey3,
                                fontWeight: Fonts.f600,
                                fontSize: Fonts.fontSize16),
                          )),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: 45,
                          alignment: Alignment.center,
                          child: const Text(
                            "By Range",
                            style: TextStyle(
                              // color: AppColors.grey3,
                                fontWeight: Fonts.f600,
                                fontSize: Fonts.fontSize16),
                          )),
                    ],
                  ),
                body: Container(
                  decoration: BoxDecoration(
                    border: borders.bt_1px_grey4,
                  ),
                  child: TabBarView(
                    children: [
                      BillReportAnalysisByDateScreen(),
                      BillReportAnalysisByMonthScreen(),
                      BillReportAnalysisByDateRangeScreen(),
                    ],
                  ),
                ),              )
          );
        },
      ),
    );
  }

  @override
  BillReportAnalysisScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    BillReportAnalysisScreenCubit cubit =
        BillReportAnalysisScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
