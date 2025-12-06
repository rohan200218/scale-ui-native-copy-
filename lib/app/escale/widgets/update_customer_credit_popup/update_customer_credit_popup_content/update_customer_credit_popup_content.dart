import 'dart:io';

import 'package:basic/app/core/logger/log.dart';
import 'package:basic/app/core/services/send_message.dart';
import 'package:basic/app/escale/models/customer_models.dart';
import 'package:basic/app/escale/models/customers_credit_models.dart';
import 'package:basic/app/escale/widgets/create_return_transaction/create_return_transaction.dart';
import 'package:basic/app/escale/widgets/create_return_transaction/create_return_transaction_controller.dart';
import 'package:basic/app/escale/widgets/customer_credit_return_type/customer_credit_return_type.dart';
import 'package:basic/app/themes/fonts.dart';
import 'package:basic/app/themes/toast.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../core/services/location_service.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/input_styles.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';
import 'package:basic/app/core/widgets/base_alert_dialog.dart';
import '../update_customer_credit_popup_data.dart';
import 'update_customer_credit_popup_content_controller.dart';
import 'update_customer_credit_popup_content_cubit.dart';
import 'package:basic/app/core/database/boolean_status.dart';
import 'package:basic/app/core/modals/popup_data.dart';

import 'package:basic/app/core/modals/base_alert_popup_content/base_alert_popup_content.dart';
import '/app/core/widgets/base_stateless_widget.dart';

class UpdateCustomerCreditPopupContent extends BaseAlertPopupContent<
    UpdateCustomerCreditPopupContentController,
    UpdateCustomerCreditPopupContentCubit,
    UpdateCustomerCreditPopupContentState,
    UpdateCustomerCreditPopupData> {
  CustomerCreditReport report;

  UpdateCustomerCreditPopupContent(
      {Key? key, super.controller, super.onStateChanged, required this.report})
      : super(key: key);
  CreateReturnTransactionController createReturnTransactionController =
      CreateReturnTransactionController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UpdateCustomerCreditPopupContentCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<UpdateCustomerCreditPopupContentCubit,
          UpdateCustomerCreditPopupContentState>(
        listener: (context, state) async {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return BaseAlertDialog(
            loadingButton: state.loadingButton!,
            title: 'Update Customer Credit',
            showSubmitButton: state.position != null
                ? null
                : Row(
              mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                          child: Text("Fetching Location...",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(),)
                      ),
                    ],
                  ),
            body: Container(
              padding: edge_insets_16,
              child: Column(
                children: [
                  CreateReturnTransaction(
                    controller: createReturnTransactionController,
                  ),
                  Container(
                    child: Text(
                      "${report.customerName.toString()} "
                      "-- \u20B9 ${report.items?.fold(0, (sum, item) => sum + (item.totalCredit ?? 0))}",
                      style: TextStyle(
                          fontWeight: Fonts.f500, fontSize: Fonts.fontSize16),
                    ),
                  ),
                  Container(
                    margin: edge_insets_t_16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Amount paid",
                          style: TextStyle(
                              fontWeight: Fonts.f500,
                              fontSize: Fonts.fontSize16),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: TextFormField(
                            decoration: InputStyles.formTemplateInput(
                              hintText: 'Enter Amount',
                            ).copyWith(
                                enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.grey4, width: 1),
                            )),
                            keyboardType: TextInputType.number,
                            onChanged: (amount) {
                              getCubit(context).setNewTotalCredit(amount);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Payment Type: ",
                              style: TextStyle(
                                  fontWeight: Fonts.f500,
                                  fontSize: Fonts.fontSize16),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            CustomerCreditReturnType(
                              onReturnTypeChange: (returnType) =>
                                  getCubit(context).setReturnType(returnType),
                              returnType: state.returnType,
                              activeColor: AppColors.bgLightBlue,
                            )
                          ],
                        ),
                        Container(
                          padding: edge_insets_y_16,
                          child: state.filePickerStatus != BooleanStatus.picked
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: AppColors.bgLightBlue,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            color: AppColors.bgPrimary2,
                                            width: 2,
                                          ),
                                          borderRadius: borderRadius.br_5,
                                        ),
                                      ),
                                      onPressed: () {
                                        getCubit(context).pickFiles();
                                      },
                                      child: Text(
                                        'Add Receipt',
                                        style: TextStyle(
                                          fontSize: Fonts.fontSize16,
                                          color: AppColors.bgPrimary2,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: edge_insets_t_16,
                                      child: Text(
                                        'Files you selected',
                                        style: TextStyle(
                                          fontWeight: Fonts.f500,
                                          fontSize: Fonts.fontSize16,
                                          color: AppColors.textHeading,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      // Enables horizontal scrolling
                                      child: Row(
                                        children: state.files
                                            .map((filePath) => Container(
                                                  margin: EdgeInsets.only(
                                                      right: 8.0),
                                                  // Add spacing between images
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.3,
                                                  height: 150,
                                                  child: Image.file(
                                                    File(filePath),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ))
                                            .toList(),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: AppColors.bgLightBlue,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            color: AppColors.bgPrimary2,
                                            width: 2,
                                          ),
                                          borderRadius: borderRadius.br_5,
                                        ),
                                      ),
                                      onPressed: () {
                                        getCubit(context).pickFiles();
                                      },
                                      child: Text(
                                        'Change Receipt',
                                        style: TextStyle(
                                          fontSize: Fonts.fontSize16,
                                          color: AppColors.bgPrimary2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            onSubmit: (state.newTotalCredit == null ||
                    state.newTotalCredit!.trim().isEmpty ||
                    state.updateCustomerCreditStatus == BooleanStatus.pending ||
                    state.returnType == null ||
                    state.position == null ||
                    state.loadingButton!)
                ? null
                : () async {
                    final newTotalCredit = int.parse(state.newTotalCredit!);
                    final currentGrandTotal = report.items?.fold(
                            0, (sum, item) => sum + (item.totalCredit ?? 0)) ??
                        0;
                    var remainingCredit = currentGrandTotal - newTotalCredit;
                    if (newTotalCredit > currentGrandTotal) {
                      ShowToast.toast(
                          "Amount should be greater than the actual credit",
                          Colors.redAccent);
                    } else {
                      getCubit(context).setLoadingButtonStatus(true);

                      int remainingCredit = int.parse(state.newTotalCredit!);

                      for (var item in report.items!) {
                        final currentItemCredit = item.totalCredit ?? 0;

                        if (remainingCredit > 0) {
                          final newItemCredit =
                              remainingCredit >= currentItemCredit
                                  ? 0
                                  : currentItemCredit - remainingCredit;

                          remainingCredit -= currentItemCredit;
                          if (remainingCredit < 0) remainingCredit = 0;

                          await getCubit(context)
                              .updateCustomerCredit(
                            getCubit(context).createRequestData(
                              customerId: report.customerId!,
                              price: item.price!,
                              newTotalCredit: newItemCredit,
                            ),
                          )
                              .then((_) async {
                            await createReturnTransactionController
                                .getChildCubit()
                                .createReturnTransaction(
                                    createReturnTransactionController
                                        .getChildCubit()
                                        .createRequestData(
                                          customerId: report.customerId,
                                          amountReturned: newTotalCredit,
                                          returnType: state.returnType,
                                          latitude: state.position?.latitude
                                              .toString(),
                                          longitude: state.position?.longitude
                                              .toString(),
                                          files: state.files
                                              .map((filePath) => File(filePath))
                                              .toList(),
                                        ))
                                .then((_) async{
                              final sms = BhashSmsService();
                              await sms.sendSms(
                                  '6300470594',
                                  '$newTotalCredit',
                                  '${report.items!.fold(0, (sum, item) => sum + (item.totalCredit ?? 0)) - newTotalCredit}'
                              );
                              // await sms.sendSms('9908351768',
                              //     'You have successfully cleared credit of $newTotalCredit. \n Your remaining credit is ${report.items!.fold(0, (sum, item) => sum + (item.totalCredit ?? 0)) - newTotalCredit}');
                            });
                          });

                          item.totalCredit = newItemCredit;

                          if (remainingCredit <= 0) {
                            break;
                          }
                        } else {
                          break;
                        }
                      }

                      closePopup(
                          context, PopupData(status: BooleanStatus.success));
                    }
                  },
            // onSubmit:
            //     (state.newTotalCredit == null || state.newTotalCredit!.trim().isEmpty
            //         || state.updateCustomerCreditStatus == BooleanStatus.pending || state.loadingButton!)
            //         ? null
            //         : () async {
            //       getCubit(context).setLoadingButtonStatus(true);
            //             await getCubit(context).updateCustomerCredit(
            //                 getCubit(context).createRequestData());
            //             closePopup(context, PopupData(status: BooleanStatus.success));
            //           },
            onClosed: () {
              closePopup(context, PopupData(status: BooleanStatus.closed));
            },
          );
        },
      ),
    );
  }

  @override
  UpdateCustomerCreditPopupContentCubit createCubitAndAssignToController(
      BuildContext context) {
    UpdateCustomerCreditPopupContentCubit cubit =
        UpdateCustomerCreditPopupContentCubit(
            context: context, customerId: report.customerId!);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
