import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../themes/app_colors.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'customer_credit_return_type_controller.dart';
import 'customer_credit_return_type_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class CustomerCreditReturnType
    extends BaseStatelessWidget<CustomerCreditReturnTypeController,
        CustomerCreditReturnTypeCubit,
        CustomerCreditReturnTypeState> {
  ValueChanged<String>? onReturnTypeChange;
  String? returnType;
  Color? activeColor;

  CustomerCreditReturnType({Key? key, super.controller, super.onStateChanged, this.returnType, this.activeColor, this.onReturnTypeChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CustomerCreditReturnTypeCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          CustomerCreditReturnTypeCubit,
          CustomerCreditReturnTypeState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Container(
            decoration: BoxDecoration(
                border: borders.b_1px_bgPrimary,
                borderRadius: borderRadius.br_5,
                color: AppColors.white04
            ),
            child: Wrap(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: edge_insets_x_4_y_1,
                  decoration: BoxDecoration(
                      color: returnType == "CASH"
                          ? activeColor ?? AppColors.white
                          : null,
                      borderRadius: borderRadius.br_5
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 24,
                        height: 36,
                        child: Radio<String>(
                          value: "CASH",
                          groupValue: returnType,
                          onChanged: (value) {
                            if (onReturnTypeChange != null) {
                              onReturnTypeChange!("CASH");
                            }
                          },
                          visualDensity: VisualDensity.compact,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (onReturnTypeChange != null) {
                            onReturnTypeChange!("CASH");
                          }
                        },
                        child: Text("CASH"),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: edge_insets_x_4_y_1,
                  decoration: BoxDecoration(
                      color: returnType == "UPI"
                          ? activeColor ?? AppColors.white
                          : null,
                      borderRadius: borderRadius.br_5
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 24,
                        height: 36,
                        child: Radio<String>(
                          value: "UPI",
                          groupValue: returnType,
                          onChanged: (value) {
                            if (onReturnTypeChange != null) {
                              onReturnTypeChange!("UPI");
                            }
                          },
                          visualDensity: VisualDensity.compact,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (onReturnTypeChange != null) {
                            onReturnTypeChange!("UPI");
                          }
                        },
                        child: Text("UPI"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  CustomerCreditReturnTypeCubit createCubitAndAssignToController(
      BuildContext context) {
    CustomerCreditReturnTypeCubit cubit = CustomerCreditReturnTypeCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
