import 'package:basic/app/escale/request_response/get_all_items/get_all_items_response.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';
import 'package:basic/app/core/database/boolean_status.dart';

import 'package:get_it/get_it.dart';

import '../../../user_accounts/services/user_account_service.dart';
import '../../request_response/get_all_customers/get_all_customers_response.dart';
import '../../request_response/get_all_trucks/get_all_trucks_response.dart';

part 'home_screen_drawer_widget_state.dart';

part 'home_screen_drawer_widget_cubit.freezed.dart';

class HomeScreenDrawerWidgetCubit
    extends BaseCubit<HomeScreenDrawerWidgetState> {
  late UserAccountService userAccountService;

  HomeScreenDrawerWidgetCubit({required super.context})
      : super(initialState: HomeScreenDrawerWidgetState.initial()){
    userAccountService=GetIt.instance<UserAccountService>();
  }

  logout(){
    userAccountService.deleteUserAuthTokenFromSharedPreferences();
  }

}
