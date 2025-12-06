import 'dart:io';

import 'package:basic/app/core/logger/log.dart';
import 'package:basic/app/core/services/location_service.dart';
import 'package:basic/app/escale/request_response/create_transaction/create_transaction_response.dart';
import 'package:basic/app/escale/request_response/update_customer/update_customer_response.dart';
import 'package:basic/app/escale/services/transaction_service.dart';
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../themes/toast.dart';
import '../../../request_response/create_transaction/create_transaction_request.dart';
import '../../../request_response/update_customer_credit/update_customer_credit_request.dart';
import '../../../request_response/update_customer_credit/update_customer_credit_response.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'update_customer_credit_popup_content_state.dart';

part 'update_customer_credit_popup_content_cubit.freezed.dart';

class UpdateCustomerCreditPopupContentCubit
    extends BaseCubit<UpdateCustomerCreditPopupContentState> {
  late TransactionService transactionService;

  UpdateCustomerCreditPopupContentCubit({required super.context, required int customerId, }) : super(
      initialState: UpdateCustomerCreditPopupContentState.initial(loadingButton: false, customerId: customerId, files: [])) {
    transactionService = GetIt.instance<TransactionService>();
    fetchLocation();
  }

  Future<void> fetchLocation() async {
    try {
      await getCurrentLocation().then((value) {
        emit(state.copyWith(position: value));
      });
    } catch (e) {
      ShowToast.toast("Failed to get location: $e", Colors.redAccent);
    }
  }

  setLoadingButtonStatus(bool? val) {
    emitState(state.copyWith(loadingButton: val));
  }
  setNewTotalCredit(String? newTotalCredit) => emit(state.copyWith(newTotalCredit: newTotalCredit));
  setReturnType(String returnType) =>
      emit(state.copyWith(returnType: returnType));


  Future<void> pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (result != null) {
      emit(state.copyWith(
        files: result.paths.whereType<String>().toList(),
        filePickerStatus: BooleanStatus.picked,
      ));
    } else {
      emit(state.copyWith(filePickerStatus: BooleanStatus.error));
    }
  }


  UpdateCustomerCreditRequest createRequestData({
    int? customerId,
    int? price,
    int? newTotalCredit,
    String? returnType,
    String? latitude,
    String? longitude,
    List<File>? files,
  }) {
    final request = UpdateCustomerCreditRequest(
      customerId: customerId,
      price: price,
      newTotalCredit: newTotalCredit,
      // returnType: returnType,
      // latitude: latitude,
      // longitude: longitude,
      // files: files
    );
    return request;
  }

  Future<void> updateCustomerCredit(UpdateCustomerCreditRequest request) async {
    return transactionService.updateCustomerCredit(request).then((value) {
      emit(state.copyWith(
          updateCustomerCreditStatus: BooleanStatus.success));
      return value;
    }).catchError((error) {
      emit(state.copyWith(updateCustomerCreditStatus: BooleanStatus.error));
      throw error;
    });
  }



  // void sendWhatsAppMessage(String phoneNumber) async {
  //   final message = "Hello, your customer credit has been successfully updated!";
  //   final url = "https://wa.me/$phoneNumber?text=${Uri.encodeFull(message)}";
  //
  //   try {
  //     if (await canLaunchUrl(Uri.parse(url))) {
  //       await launchUrl(Uri.parse(url));
  //     } else {
  //       ShowToast.toast("Could not open WhatsApp", Colors.redAccent);
  //     }
  //   } catch (e) {
  //     ShowToast.toast("Error: $e", Colors.redAccent);
  //   }
  // }

}
