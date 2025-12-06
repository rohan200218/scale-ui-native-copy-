import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'bill_report_analysis_by_month_screen_state.dart';

part 'bill_report_analysis_by_month_screen_cubit.freezed.dart';

class BillReportAnalysisByMonthScreenCubit
    extends BaseCubit<BillReportAnalysisByMonthScreenState> {
  BillReportAnalysisByMonthScreenCubit({required super.context})
      : super(
            initialState: BillReportAnalysisByMonthScreenState.initial(
                selectedMonth: DateTime.now().month,
                selectedYear: DateTime.now().year));
}
