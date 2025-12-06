import 'dart:io';

import 'package:basic/app/escale/request_response/create_return_transaction/create_return_transaction_response.dart';
import 'package:basic/app/escale/services/transaction_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../request_response/create_return_transaction/create_return_transaction_request.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'create_return_transaction_state.dart';

part 'create_return_transaction_cubit.freezed.dart';

class CreateReturnTransactionCubit
    extends BaseCubit<CreateReturnTransactionState> {
  late TransactionService transactionService;
  CreateReturnTransactionCubit({required super.context})
      : super(initialState: CreateReturnTransactionState.initial()){
    transactionService=GetIt.instance<TransactionService>();
  }


    CreateReturnTransactionRequest createRequestData({
      int? customerId,
      int? amountReturned,
      String? returnType,
      String? latitude,
      String? longitude,
      List<File>? files
}) {
        final request = CreateReturnTransactionRequest(
          customerId: customerId,
          amountReturned: amountReturned,
          returnType: returnType,
          latitude: latitude,
          longitude: longitude,
          files: files
        );
        return request;
      }

    Future<CreateReturnTransactionResponse> createReturnTransaction(
          CreateReturnTransactionRequest request) async {
        return transactionService.createReturnTransaction(request).then((value) {
          emit(state.copyWith(
              createReturnTransactionResponse: value,
              createReturnTransactionStatus: BooleanStatus.success));
          return Future.value(value);
        }).catchError((error) {
          emit(state.copyWith(createReturnTransactionStatus: BooleanStatus.error));
          throw error;
        });
      }

}
