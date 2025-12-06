import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'bill_report_analysis_by_date_range_screen_state.dart';

part 'bill_report_analysis_by_date_range_screen_cubit.freezed.dart';

class BillReportAnalysisByDateRangeScreenCubit
    extends BaseCubit<BillReportAnalysisByDateRangeScreenState> {
  BillReportAnalysisByDateRangeScreenCubit({required super.context})
      : super(
            initialState: BillReportAnalysisByDateRangeScreenState.initial(
                startDate: DateTime.now().subtract(const Duration(days: 1)),
                endDate: DateTime.now()));
}
