import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../themes/fonts.dart';
import '../../../themes/input_styles.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';
import '/app/core/widgets/base_form_stateless_widget.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'user_account_signup_form_controller.dart';
import 'user_account_signup_form_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class UserAccountSignupForm
    extends BaseFormStatelessWidget<UserAccountSignupFormController,
        UserAccountSignupFormCubit,
        UserAccountSignupFormState> {

  UserAccountSignupForm({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserAccountSignupFormCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<UserAccountSignupFormCubit,
          UserAccountSignupFormState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final formGroup = getCubit(context).formGroup;
          return ReactiveFormBuilder(
            form: () => formGroup,
            builder: (context, form, child) {
              return ReactiveForm(
                  formGroup: formGroup,
                  child: Container(
                    padding: edge_insets_x_16,
                    child: Column(
                      children: [
                        Container(
                          margin: edge_insets_t_16,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                // padding: edge_insets_y_8,
                                child: const Text(
                                  "Username",
                                  style: TextStyle(
                                      fontSize: Fonts.fontSize16,
                                      fontWeight: Fonts.f500
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ReactiveTextField<String>(
                                style: const TextStyle(fontWeight: Fonts.f500),
                                formControlName: 'username',
                                decoration: InputStyles.formTemplateInput(
                                    hintText: 'Enter Username'
                                ).copyWith(contentPadding: edge_insets_12),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: edge_insets_t_16,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                // padding: edge_insets_y_8,
                                child: const Text(
                                  "Email",
                                  style: TextStyle(
                                      fontSize: Fonts.fontSize16,
                                      fontWeight: Fonts.f500
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ReactiveTextField<String>(
                                style: const TextStyle(fontWeight: Fonts.f500),
                                formControlName: 'email',
                                decoration: InputStyles.formTemplateInput(
                                    hintText: 'Enter Email'
                                ).copyWith(contentPadding: edge_insets_12),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: edge_insets_t_16,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                // padding: edge_insets_y_8,
                                child: const Text(
                                  "Password",
                                  style: TextStyle(
                                      fontSize: Fonts.fontSize16,
                                      fontWeight: Fonts.f500
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ReactiveTextField<String>(
                                style: const TextStyle(fontWeight: Fonts.f500),
                                formControlName: 'password',
                                obscureText: true,

                                validationMessages: {
                                  ValidationMessage.required: (_) =>
                                  'The password must not be empty',
                                },
                                decoration: InputStyles.formTemplateInput(
                                    hintText: 'Enter Password'
                                ).copyWith(contentPadding: edge_insets_12),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ));
            },
          );
        },
      ),
    );
  }

  @override
  UserAccountSignupFormCubit createCubitAndAssignToController(
      BuildContext context) {
    UserAccountSignupFormCubit cubit = UserAccountSignupFormCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
