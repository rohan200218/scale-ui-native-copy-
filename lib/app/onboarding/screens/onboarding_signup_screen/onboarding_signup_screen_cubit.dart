import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';

import 'package:get_it/get_it.dart';

import '../../../user_accounts/widgets/user_account_signup_form/user_account_signup_form_cubit.dart';

part 'onboarding_signup_screen_state.dart';

part 'onboarding_signup_screen_cubit.freezed.dart';

class OnboardingSignupScreenCubit
    extends BaseCubit<OnboardingSignupScreenState> {
  final ValueNotifier<bool> loadingButtonNotifier = ValueNotifier<bool>(false);
  OnboardingSignupScreenCubit({required super.context})
      : super(initialState: OnboardingSignupScreenState.initial());

  setLoadingButtonStatus(bool? val) {
    loadingButtonNotifier.value = val!;
    emitState(state.copyWith(loadingButton: val));
  }

}
