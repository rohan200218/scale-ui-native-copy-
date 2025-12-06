import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'customer_credit_return_type_state.dart';

part 'customer_credit_return_type_cubit.freezed.dart';

class CustomerCreditReturnTypeCubit
    extends BaseCubit<CustomerCreditReturnTypeState> {
  CustomerCreditReturnTypeCubit({required super.context})
      : super(initialState: CustomerCreditReturnTypeState.initial());
}
