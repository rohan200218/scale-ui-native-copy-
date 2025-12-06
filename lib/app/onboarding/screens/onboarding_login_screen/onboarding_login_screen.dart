import 'package:basic/app/core/utils/authentication/authentication_utils.dart';
import 'package:basic/app/core/widgets/app_scaffold_basic.dart';
import 'package:basic/app/themes/borders.dart';
import 'package:basic/app/themes/shadows.dart';
import 'package:basic/app/user_accounts/models/users/user_account.dart';
import 'package:basic/app/user_accounts/widgets/user_accounts_login_form_widget/user_accounts_login_form_widget.dart';
import 'package:basic/app/user_accounts/widgets/user_accounts_login_form_widget/user_accounts_login_form_widget_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../authentication/authentication_cubit.dart';
import '../../../core/database/boolean_status.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/edge_insets.dart';
import '../../../themes/fonts.dart';
import 'onboarding_login_screen_controller.dart';
import 'onboarding_login_screen_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class OnboardingLoginScreen extends BaseStatelessWidget<
    OnboardingLoginScreenController,
    OnboardingLoginScreenCubit,
    OnboardingLoginScreenState> {
  OnboardingLoginScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);
  UserAccountsLoginFormWidgetController userAccountsLoginFormWidgetController =
      UserAccountsLoginFormWidgetController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardingLoginScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child:
          BlocConsumer<OnboardingLoginScreenCubit, OnboardingLoginScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final screenWidth = MediaQuery.sizeOf(context).width;
          final largeScreen = screenWidth > 600;
          return AppScaffoldBasic(
            appBarTitle: Text("Login"),
            body: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                margin: edge_insets_b_16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 40,),
                    Container(
                      width: largeScreen? screenWidth * 0.6 : null,
                      padding: edge_insets_y_16,
                      margin: edge_insets_x_16,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          border: borders.b_1px_bgLightBlue,
                          borderRadius: borderRadius.br_10,
                          boxShadow: [shadows.bs_primary]
                      ),
                      child: Column(
                        children: [
                          UserAccountsLoginFormWidget(
                            controller: userAccountsLoginFormWidgetController,
                            onStateChanged: (userAccountsLoginFormWidgetState) =>
                                getCubit(context).emitState(state.copyWith(
                                    userAccountsLoginFormWidgetState:
                                    userAccountsLoginFormWidgetState)),
                          ),
                          ValueListenableBuilder<bool>(
                            valueListenable: getCubit(context).loadingButtonNotifier,
                            builder: (context, isLoading, child) {
                              return Container(
                                alignment: Alignment.bottomCenter,
                                padding: edge_insets_t_24,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    padding: edge_insets_x_80_y_12,
                                    backgroundColor: AppColors.bgPrimary2,
                                    disabledBackgroundColor: AppColors.grey1,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: borderRadius.br_5,
                                    ),
                                  ),
                                  onPressed: (state.userAccountsLoginFormWidgetState?.userLoginStatus ==
                                      BooleanStatus.pending ||
                                      state.userAccountsLoginFormWidgetState?.formValid !=
                                          ControlStatus.valid ||
                                      isLoading)
                                      ? null
                                      : () async {
                                    try {
                                      getCubit(context).setLoadingButtonStatus(true);
                                      UserAccount userAccount =
                                      await userAccountsLoginFormWidgetController
                                          .getChildCubit()
                                          .login(userAccountsLoginFormWidgetController
                                          .getChildCubit()
                                          .createRequestData());
                                      BlocProvider.of<AuthenticationCubit>(context)
                                          .saveUserAccount(userAccount);
                                      AuthenticationUtils.getUserAccountFromSharedPreferences();
                                      context.go("/home");
                                    } finally {
                                      getCubit(context).setLoadingButtonStatus(false);
                                    }
                                  },
                                  child: isLoading
                                      ? SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(color: Colors.white),
                                  )
                                      : Text(
                                    "Login",
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: Fonts.f500,
                                      fontSize: Fonts.fontSize18,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("New User? ", style: TextStyle(
                                  fontSize: Fonts.fontSize16
                              ),),
                              InkWell(
                                onTap: (){
                                  context.push("/signup");
                                },
                                child: Container(
                                  padding: edge_insets_4,
                                  child: Text("Signup", style: TextStyle(
                                      color: AppColors.bgPrimary,
                                      fontWeight: Fonts.f700,
                                      fontSize: Fonts.fontSize16
                                  ),),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 40,),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  OnboardingLoginScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    OnboardingLoginScreenCubit cubit =
        OnboardingLoginScreenCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
