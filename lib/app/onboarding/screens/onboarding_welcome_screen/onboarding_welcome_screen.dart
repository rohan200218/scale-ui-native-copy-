import 'package:basic/app/core/widgets/app_scaffold_basic.dart';
import 'package:basic/app/onboarding/widgets/login.dart';
import 'package:basic/app/themes/borders.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../themes/edge_insets.dart';
import '../../../themes/fonts.dart';
import 'onboarding_welcome_screen_controller.dart';
import 'onboarding_welcome_screen_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class OnboardingWelcomeScreen extends BaseStatelessWidget<
    OnboardingWelcomeScreenController,
    OnboardingWelcomeScreenCubit,
    OnboardingWelcomeScreenState> {

  OnboardingWelcomeScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardingWelcomeScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          OnboardingWelcomeScreenCubit,
          OnboardingWelcomeScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return AppScaffoldBasic(
              body: SingleChildScrollView(
                padding: edge_insets_16,
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      Icon(
                        Icons.scale,
                        size: 100,
                        color: Colors.blueAccent,
                      ),
                      const SizedBox(height: 20),
                      // The welcome message
                      const Text(
                        "⚖️ Electronic Weighing Scale\nHelps in your inventory management",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: Fonts.f700,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 30),
                      OutlinedButton(
                        onPressed: () {
                          context.go("/login");
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.blueAccent),
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: borderRadius.br_10,
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: Fonts.fontSize18,
                            fontWeight: Fonts.f700,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      OutlinedButton(
                        onPressed: () {
                          context.go("/signup");
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.blueAccent),
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 34),
                          shape: RoundedRectangleBorder(
                            borderRadius: borderRadius.br_10,
                          ),
                        ),
                        child: const Text(
                          'Signup',
                          style: TextStyle(
                            fontSize: Fonts.fontSize18,
                            fontWeight: Fonts.f700,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
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
  OnboardingWelcomeScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    OnboardingWelcomeScreenCubit cubit = OnboardingWelcomeScreenCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
