import 'package:basic/app/escale/request_response/get_all_customers/get_all_customers_response.dart';
import 'package:basic/app/escale/request_response/get_all_trucks/get_all_trucks_response.dart';
import 'package:basic/app/escale/widgets/bulk_update_cash/bulk_update_cash_cubit.dart';
import 'package:basic/app/escale/widgets/bulk_update_credit/bulk_update_credit_cubit.dart';
import 'package:basic/app/escale/widgets/get_transactions_by_date_truck_customer/get_transactions_by_date_truck_customer_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';
import 'package:basic/app/core/database/boolean_status.dart';

import 'package:get_it/get_it.dart';

import '../../models/customer_models.dart';
import '../../models/truck_models.dart';

part 'adjustment_screen_state.dart';

part 'adjustment_screen_cubit.freezed.dart';

class AdjustmentScreenCubit extends BaseCubit<AdjustmentScreenState> {
  final ValueNotifier<bool> loadingButtonNotifier = ValueNotifier<bool>(false);
  AdjustmentScreenCubit({required super.context})
      : super(initialState: AdjustmentScreenState.initial(loadingButton: false));

  void setSelectedTruck(Trucks? truck) => emit(state.copyWith(selectedTruck: truck));
  void setSelectedCustomer(Customers? customer) => emit(state.copyWith(selectedCustomer: customer));

  setLoadingButtonStatus(bool? val) {
    loadingButtonNotifier.value = val!;
    emitState(state.copyWith(loadingButton: val));
  }

}
