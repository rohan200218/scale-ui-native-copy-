import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'bill_statement_screen_state.dart';

part 'bill_statement_screen_cubit.freezed.dart';

class BillStatementScreenCubit extends BaseCubit<BillStatementScreenState> {
  BillStatementScreenCubit({required super.context})
      : super(initialState: BillStatementScreenState.initial());
}
