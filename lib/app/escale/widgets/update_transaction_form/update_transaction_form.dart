import 'package:basic/app/core/logger/log.dart';
import 'package:basic/app/escale/models/customer_models.dart';
import 'package:basic/app/escale/models/transaction_models.dart';
import 'package:basic/app/escale/request_response/get_all_customers/get_all_customers_response.dart';
import 'package:basic/app/escale/widgets/customer_dropdown/customer_dropdown.dart';
import 'package:basic/app/escale/widgets/sell_template_purchase_type/sell_template_purchase_type.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/fonts.dart';
import '../../../themes/input_styles.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';
import '/app/core/widgets/base_form_stateless_widget.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'update_transaction_form_controller.dart';
import 'update_transaction_form_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class UpdateTransactionForm extends BaseFormStatelessWidget<
    UpdateTransactionFormController,
    UpdateTransactionFormCubit,
    UpdateTransactionFormState> {
  List<Customers> customers;
  Transactions transaction;
  Customers? selectedCustomer;
  UpdateTransactionForm({Key? key, super.controller, super.onStateChanged, required this.customers, required this.transaction, this.selectedCustomer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider<UpdateTransactionFormCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child:
          BlocConsumer<UpdateTransactionFormCubit, UpdateTransactionFormState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final initialCustomer = getCubit(context).findCustomerById(customers, state.transaction.customerid);
          final formGroup = getCubit(context).formGroup;
          return ReactiveFormBuilder(
            form: () => formGroup,
            builder: (context, form, child) {
              return ReactiveForm(
                  formGroup: formGroup,
                  child: Container(
                    padding: edge_insets_16,
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Customers",
                                style: TextStyle(
                                  fontWeight: Fonts.f500,
                                  fontSize: Fonts.fontSize16,
                                  color: AppColors.textHeading,
                                ),
                              ),
                              SizedBox(height: 6),
                              // Text(state.transaction.toJson().toString()),
                              CustomerDropdown(
                                  initialCustomer: initialCustomer ?? selectedCustomer,
                                  onChanged: (customer) {
                                    getCubit(context)
                                        .setSelectedCustomer(customer);
                                  },
                                  customers: customers
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Item",
                                      style: TextStyle(
                                        fontWeight: Fonts.f500,
                                        fontSize: Fonts.fontSize16,
                                        color: AppColors.textHeading,
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    ReactiveTextField<String>(
                                      readOnly: true,
                                      style: TextStyle(fontWeight: Fonts.f500),
                                      formControlName: 'items',
                                      decoration: InputStyles.formTemplateInput(hintText: "Enter Items"),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: edge_insets_l_16,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Purchase Type",
                                      style: TextStyle(
                                        fontWeight: Fonts.f500,
                                        fontSize: Fonts.fontSize16,
                                        color: AppColors.textHeading,
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    SellTemplatePurchaseType(
                                      activeColor: AppColors.bgLightBlue,
                                      onPurchaseTypeChange: (purchaseType) =>
                                          getCubit(context)
                                              .setPurchaseType(purchaseType),
                                      purchaseType: state.purchaseType ?? state.transaction.purchasetype?.toUpperCase(),
                                    ),
                                  ],
                                ),
                              ),
                            ]
                          )
                        ),
                        Container(
                          margin: edge_insets_t_10,
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Bags",
                                      style: TextStyle(
                                        fontWeight: Fonts.f500,
                                        fontSize: Fonts.fontSize16,
                                        color: AppColors.textHeading,
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    ReactiveTextField<String>(
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(fontWeight: Fonts.f500),
                                      formControlName: 'bags',
                                      decoration: InputStyles.formTemplateInput(hintText: "Enter bags"),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 16), // Space between the two input fields
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Weight",
                                      style: TextStyle(
                                        fontWeight: Fonts.f500,
                                        fontSize: Fonts.fontSize16,
                                        color: AppColors.textHeading,
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    ReactiveTextField<String>(
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(fontWeight: Fonts.f500),
                                      formControlName: 'weight',
                                      decoration: InputStyles.formTemplateInput(hintText: "Enter weight"),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 16), // Space between the two input fields
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Price",
                                      style: TextStyle(
                                        fontWeight: Fonts.f500,
                                        fontSize: Fonts.fontSize16,
                                        color: AppColors.textHeading,
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    ReactiveTextField<String>(
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(fontWeight: Fonts.f500),
                                      formControlName: 'price',
                                      decoration: InputStyles.formTemplateInput(hintText: "Enter price"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
              );
            },
          );
        },
      ),
    );
  }

  @override
  UpdateTransactionFormCubit createCubitAndAssignToController(
      BuildContext context) {
    UpdateTransactionFormCubit cubit =
        UpdateTransactionFormCubit(context: context, transaction: transaction);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
