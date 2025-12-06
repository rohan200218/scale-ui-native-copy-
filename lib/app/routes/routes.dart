import 'package:basic/app/escale/screens/adjustment_screen/adjustment_screen.dart';
import 'package:basic/app/escale/screens/bill_collection_screen/bill_collection_screen.dart';
import 'package:basic/app/escale/screens/bill_report_analysis_screen/bill_report_analysis_screen.dart';
import 'package:basic/app/escale/screens/bill_statement_screen/bill_statement_screen.dart';
import 'package:basic/app/escale/screens/customer_screen/customer_screen.dart';
import 'package:basic/app/escale/screens/home_screen/home_screen.dart';
import 'package:basic/app/escale/screens/receipt_screen/receipt_screen.dart';
import 'package:basic/app/escale/screens/receive_screen/receive_screen.dart';
import 'package:basic/app/escale/screens/report_screen/report_screen.dart';
import 'package:basic/app/escale/screens/sell_screen/sell_screen.dart';
import 'package:basic/app/escale/screens/sell_screen_new/sell_screen_new.dart';
import 'package:basic/app/escale/screens/setting_screen/setting_screen.dart';
import 'package:basic/app/onboarding/screens/onboarding_login_screen/onboarding_login_screen.dart';
import 'package:basic/app/onboarding/screens/onboarding_signup_screen/onboarding_signup_screen.dart';
import 'package:basic/app/onboarding/screens/onboarding_welcome_screen/onboarding_welcome_screen.dart';
import 'package:basic/app/onboarding/widgets/login.dart';
import 'package:basic/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart';

import '../authentication/authentication_cubit.dart';
import '../core/database/boolean_status.dart';
import '../escale/widgets/get_all_customers/get_all_customers.dart';
import '../onboarding/widgets/auth_service.dart';


final AuthService authService = AuthService();

final GoRouter router = GoRouter(routes: [
  // GoRoute(
  //   path: '/',
  //   builder: (context, state) {
  //     return FutureBuilder<bool>(
  //       future: authService.isLoggedIn(),
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return Scaffold(
  //             body: Center(child: CircularProgressIndicator()),
  //           );
  //         } else if (snapshot.hasData && snapshot.data == true) {
  //           // User is logged in, go to HomeScreen
  //           return HomeScreen();
  //         } else {
  //           // User is not logged in, show WelcomeScreen
  //           return OnboardingWelcomeScreen();
  //         }
  //       },
  //     );
  //   },
  // ),
  GoRoute(
      path: '/',
      builder: (context, state) {
        return BlocListener<AuthenticationCubit, AuthenticationState>(
          listener: (context, state) {
            if (state.authenticationStatus == BooleanStatus.success) {
              context.go('/home');
            } else if (state.authenticationStatus == BooleanStatus.error) {
              context.go('/welcome');
            } else {
              context.go('/welcome');
            }
          },
          child: const SizedBox(),
        );
      }),

  GoRoute(
      path: '/welcome',
      builder: (context, state) {
        return OnboardingWelcomeScreen();
      }),
  GoRoute(
      path: '/login',
      builder: (context, state) {
        return OnboardingLoginScreen();
      }
  ),
  GoRoute(
      path: '/signup',
      builder: (context, state) {
        return OnboardingSignupScreen();
      }
  ),
  GoRoute(
      path: '/home',
      builder: (context, state) {
        return HomeScreen();
      }
  ),
  GoRoute(
      path: '/receive',
      builder: (context, state) {
        return ReceiveScreen();
      }
  ),
  GoRoute(
      path: '/sell',
      builder: (context, state) {
        return SellScreenNew();
      }
  ),
  GoRoute(
      path: '/customers',
      builder: (context, state) {
        return CustomerScreen();
      }
  ),
  GoRoute(
      path: '/adjustments',
      builder: (context, state) {
        return AdjustmentScreen();
      }
  ),
  GoRoute(
      path: '/bill',
      builder: (context, state) {
        return BillCollectionScreen();
      }
  ),
  GoRoute(
      path: '/bill-statements',
      builder: (context, state) {
        return BillStatementScreen();
      }
  ),
  GoRoute(
      path: '/bill-analysis',
      builder: (context, state) {
        return BillReportAnalysisScreen();
      }
  ),
  GoRoute(
      path: '/report',
      builder: (context, state) {
        return ReportScreen();
      }
  ),
  GoRoute(
      path: '/receipt',
      builder: (context, state) {
        return ReceiptScreen();
      }
  ),
  GoRoute(
      path: '/settings',
      builder: (context, state) {
        return SettingScreen();
      }
  ),


]);

