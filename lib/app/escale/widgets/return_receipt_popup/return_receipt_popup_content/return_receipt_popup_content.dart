import 'package:basic/app/escale/models/return_transaction_models.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/fonts.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';
import 'package:basic/app/core/widgets/base_alert_dialog.dart';
import '../return_receipt_popup_data.dart';
import 'return_receipt_popup_content_controller.dart';
import 'return_receipt_popup_content_cubit.dart';
import 'package:basic/app/core/database/boolean_status.dart';
import 'package:basic/app/core/modals/popup_data.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:basic/app/core/modals/base_alert_popup_content/base_alert_popup_content.dart';
import '/app/core/widgets/base_stateless_widget.dart';


class ReturnReceiptPopupContent extends BaseAlertPopupContent<ReturnReceiptPopupContentController,
    ReturnReceiptPopupContentCubit, ReturnReceiptPopupContentState, ReturnReceiptPopupData> {
  final ReturnTransactions transaction;

  ReturnReceiptPopupContent({Key? key, super.controller, super.onStateChanged, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReturnReceiptPopupContentCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<ReturnReceiptPopupContentCubit, ReturnReceiptPopupContentState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final screenWidth = MediaQuery.sizeOf(context).width;
          final screenHeight = MediaQuery.sizeOf(context).height;
          final isLargeScreen = screenWidth > 600;

          final fileIds = transaction.receipt!.split(',').map((id) => id.trim()).toList();
          return BaseAlertDialog(
            showActionButtons: false,
            loadingButton: state.loadingButton!,
            title: 'Proof of Statement',
            body: Container(
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: fileIds.map((fileId) => ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: screenHeight * 0.6),
                        child: InteractiveViewer(
                            minScale: 0.5,
                            maxScale: 4.0,
                            child: CachedNetworkImage(
                              imageUrl: "https://drive.google.com/uc?export=view&id=$fileId",
                              // height: MediaQuery.sizeOf(context).height*0.6,
                              width: fileIds.length > 1
                                  ? isLargeScreen ? screenWidth * 0.56 : screenWidth * 0.9
                                  : isLargeScreen ? screenWidth * 0.6 : screenWidth * 0.95,
                              fit: BoxFit.fill,
                              placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, error, stackTrace) {
                                return Container(
                                  alignment: Alignment.center,
                                  height: 100,
                                  child: Text('No receipt found', style: TextStyle(
                                      fontSize: Fonts.fontSize16,
                                      fontWeight: Fonts.f500
                                  ),),
                                );
                              },
                            )
                        ),
                      )).toList(),
                    ),
                  ),
                  Container(
                    padding: edge_insets_y_8,
                    decoration: BoxDecoration(
                      border: borders.bt_1px_grey4
                    ),
                    child: Row(
                      children: [
                        SizedBox(width:  isLargeScreen ? screenWidth * 0.2 : screenWidth * 0.25,),
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: borderRadius.br_5),
                              padding: edge_insets_x_30,
                              side: const BorderSide(
                                  width: 2, color: AppColors.bgPrimary),
                            ),
                            onPressed: (){
                              closePopup(context, PopupData(status: BooleanStatus.closed));
                            },
                            child: const Text(
                              'Close',
                              style: TextStyle(fontWeight: Fonts.f500),
                            ),
                          ),
                        ),
                        SizedBox(width:  isLargeScreen ? screenWidth * 0.2 : screenWidth * 0.25,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            onSubmit: () {},
            onClosed: () {
              closePopup(context, PopupData(status: BooleanStatus.closed));
            },
          );
        },
      ),
    );
  }

  @override
  ReturnReceiptPopupContentCubit createCubitAndAssignToController(BuildContext context) {
    ReturnReceiptPopupContentCubit cubit = ReturnReceiptPopupContentCubit(context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
