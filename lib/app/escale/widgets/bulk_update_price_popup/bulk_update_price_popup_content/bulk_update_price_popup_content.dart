import 'package:basic/app/core/database/boolean_status.dart';
import 'package:basic/app/core/modals/popup_data.dart';
import 'package:basic/app/core/widgets/base_alert_dialog.dart';
import 'package:basic/app/escale/models/customer_models.dart';
import 'package:basic/app/escale/models/truck_models.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/fonts.dart';
import '../../../../themes/input_styles.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';
import 'package:basic/app/escale/widgets/bulk_update_price_popup/bulk_update_price_popup_data.dart';
import 'bulk_update_price_popup_content_controller.dart';
import 'bulk_update_price_popup_content_cubit.dart';

import 'package:basic/app/core/modals/base_alert_popup_content/base_alert_popup_content.dart';
import '/app/core/widgets/base_stateless_widget.dart';


class BulkUpdatePricePopupContent extends BaseAlertPopupContent<
    BulkUpdatePricePopupContentController,
    BulkUpdatePricePopupContentCubit,
    BulkUpdatePricePopupContentState,
    BulkUpdatePricePopupData> {
  int selectedCustomer;
  int selectedTruck;

  BulkUpdatePricePopupContent(
      {Key? key, super.controller, super.onStateChanged, required this.selectedTruck, required this.selectedCustomer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BulkUpdatePricePopupContentCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<BulkUpdatePricePopupContentCubit,
          BulkUpdatePricePopupContentState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return BaseAlertDialog(
            loadingButton: state.loadingButton!,
            title: 'Bulk Update Price',
            body: Container(
              padding: edge_insets_16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Price", style: TextStyle(fontWeight: Fonts.f500, fontSize: Fonts.fontSize16),),
                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: InputStyles.formTemplateInput(
                      hintText: 'price',
                    ).copyWith(enabledBorder : OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.grey4, width: 1),
                    )),
                    keyboardType:
                    TextInputType.number,
                    onChanged: (price) =>
                        getCubit(context).setConstPrice(price),
                  ),
                  SizedBox(height: 30,)
                ],
              ),
            ),
            onSubmit:  (state.price == null || state.price!.trim().isEmpty || state.loadingButton!)
                ? null
                :() async{
              getCubit(context).setLoadingButtonStatus(true);
              await getCubit(context).bulkUpdatePrice(getCubit(context).createRequestData());
              closePopup(context, PopupData(status: BooleanStatus.success));
            },

            onClosed: () {
              closePopup(context, PopupData(status: BooleanStatus.success));
            },
          );
        },
      ),
    );
  }

  @override
  BulkUpdatePricePopupContentCubit createCubitAndAssignToController(
      BuildContext context) {
    BulkUpdatePricePopupContentCubit cubit =
    BulkUpdatePricePopupContentCubit(context: context, customer: selectedCustomer, truck: selectedTruck);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}


// class BulkUpdatePricePopupContent extends BaseAlertPopupContent<
//     BulkUpdatePricePopupContentController,
//     BulkUpdatePricePopupContentCubit,
//     BulkUpdatePricePopupContentState,
//     BulkUpdatePricePopupData> {
//   BulkUpdatePricePopupContent(
//       {Key? key, super.controller, super.onStateChanged})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<BulkUpdatePricePopupContentCubit>(
//       create: (context) => createCubitAndAssignToController(context),
//       child: BlocConsumer<BulkUpdatePricePopupContentCubit,
//           BulkUpdatePricePopupContentState>(
//         listener: (context, state) {
//           if (onStateChanged != null) {
//             onStateChanged!(state);
//           }
//         },
//         builder: (context, state) {
//           initializeController(context);
//           final screenWidth = MediaQuery.sizeOf(context).width;
//           final isLargeScreen = screenWidth > 600;
//           return Dialog(
//             backgroundColor: AppColors.white,
//             insetPadding: EdgeInsets.zero,
//             shape: RoundedRectangleBorder(borderRadius: borderRadius.br_10),
//             // Removes default padding around the dialog
//             child: SingleChildScrollView(
//               child: Container(
//                 padding: edge_insets_16,
//                 width: isLargeScreen ? screenWidth *0.6 : screenWidth * 0.95, // Set width to match the screen width
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Example Alert Popup',
//                     ),
//                     const SizedBox(height: 160),
//                     Text('This is a full-width alert dialog example.'),
//                     const SizedBox(height: 1600),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                             child: OutlinedButton(
//                               style: OutlinedButton.styleFrom(
//                                   side: const BorderSide(width: 2, color: AppColors.bgPrimary)),
//                               onPressed: (){
//                                 closePopup(context, PopupData(status: BooleanStatus.success));
//                               },
//                               child: const Text('Cancel',
//                                 style: TextStyle(
//                                     fontWeight: Fonts.f500
//                                 ),
//                               ),
//                             )),
//                         const SizedBox(
//                           width: 20,
//                         ),
//                         Expanded(
//                             child: OutlinedButton(
//                               style: OutlinedButton.styleFrom(
//                                   side: const BorderSide(width: 2, color: AppColors.bgPrimary)),
//                               onPressed: (){
//                               },
//                               child: const Text('Cancel',
//                                 style: TextStyle(
//                                     fontWeight: Fonts.f500
//                                 ),
//                               ),
//                             )),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//
//           // return AlertDialog(
//           //   insetPadding: edge_insets_8,
//           //   title: Text('Alert Popup'),
//           //   content: Text("qwer"),
//           //   actions: [
//           //     Row(
//           //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //       children: [
//           //         Expanded(
//           //             child: OutlinedButton(
//           //               style: OutlinedButton.styleFrom(
//           //                   side: const BorderSide(width: 2, color: AppColors.bgPrimary)),
//           //               onPressed: (){
//           //                 closePopup(context, PopupData(status: BooleanStatus.success));
//           //               },
//           //               child: const Text('Cancel',
//           //                 style: TextStyle(
//           //                     fontWeight: Fonts.f500
//           //                 ),
//           //               ),
//           //             )),
//           //         const SizedBox(
//           //           width: 20,
//           //         ),
//           //         Expanded(
//           //             child: OutlinedButton(
//           //               style: OutlinedButton.styleFrom(
//           //                   side: const BorderSide(width: 2, color: AppColors.bgPrimary)),
//           //               onPressed: (){
//           //               },
//           //               child: const Text('Cancel',
//           //                 style: TextStyle(
//           //                     fontWeight: Fonts.f500
//           //                 ),
//           //               ),
//           //             )),
//           //       ],
//           //     ),
//           //   ],
//           // );
//         },
//       ),
//     );
//   }
//
//   @override
//   BulkUpdatePricePopupContentCubit createCubitAndAssignToController(
//       BuildContext context) {
//     BulkUpdatePricePopupContentCubit cubit =
//         BulkUpdatePricePopupContentCubit(context: context);
//     controller?.cubit = cubit;
//     controller?.childContext = context;
//     return cubit;
//   }
// }
