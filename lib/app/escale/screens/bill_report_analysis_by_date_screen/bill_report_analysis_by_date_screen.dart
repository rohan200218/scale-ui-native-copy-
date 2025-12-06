import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/date_time/app_date_time_utils.dart';
import '../../../themes/fonts.dart';
import '../../widgets/get_collections_by_date/get_collections_by_date.dart';
import '../../widgets/get_collections_by_date/get_collections_by_date_controller.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'bill_report_analysis_by_date_screen_controller.dart';
import 'bill_report_analysis_by_date_screen_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class BillReportAnalysisByDateScreen
    extends BaseStatelessWidget<BillReportAnalysisByDateScreenController,
        BillReportAnalysisByDateScreenCubit,
        BillReportAnalysisByDateScreenState> {
  BillReportAnalysisByDateScreen(
      {Key? key, super.controller, super.onStateChanged})
      : super(key: key);
  GetCollectionsByDateController getCollectionsByDateController =
  GetCollectionsByDateController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BillReportAnalysisByDateScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          BillReportAnalysisByDateScreenCubit,
          BillReportAnalysisByDateScreenState>(
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
                      "Total Collections",
                      style: TextStyle(
                          fontWeight: Fonts.f500, fontSize: Fonts.fontSize16),
                    ),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: state.selectedDate,
                        firstDate: DateTime(2000), // Start date limit
                        lastDate: DateTime(2100), // End date limit
                      );
                      if (pickedDate != null && pickedDate != selectedDate) {
                        getCubit(context).emitState(state.copyWith(selectedDate: pickedDate));
                        selectedDate = pickedDate;
                        getCollectionsByDateController
                            .getChildCubit()
                            .getCollectionsByDate(getCollectionsByDateController
                            .getChildCubit()
                            .createRequestData());
                      }
                    },
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${state.selectedDate?.toLocal()}".split(' ')[0],
                            style: TextStyle(fontSize: 16),
                          ),
                          Icon(Icons.calendar_today, size: 20),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GetCollectionsByDate(
                    key: ValueKey(state.selectedDate),
                    controller: getCollectionsByDateController,
                    date: AppDateTimeUtils.getDateFormatReverse(state.selectedDate!),
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
  BillReportAnalysisByDateScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    BillReportAnalysisByDateScreenCubit cubit = BillReportAnalysisByDateScreenCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
