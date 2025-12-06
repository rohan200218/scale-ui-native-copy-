import 'package:basic/app/core/utils/date_time/app_date_time_utils.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'bill_report_analysis_screen_state.dart';

part 'bill_report_analysis_screen_cubit.freezed.dart';

class BillReportAnalysisScreenCubit
    extends BaseCubit<BillReportAnalysisScreenState> {
  BillReportAnalysisScreenCubit({required super.context})
      : super(initialState: BillReportAnalysisScreenState.initial(selectedDate: DateTime.now()));
}
