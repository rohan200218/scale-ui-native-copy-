import 'package:basic/app/escale/request_response/get_all_return_transactions/get_all_return_transactions_response.dart';
import 'package:basic/app/escale/services/transaction_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../request_response/get_all_return_transactions/get_all_return_transactions_request.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';
import 'package:url_launcher/url_launcher.dart';

part 'get_all_return_transactions_state.dart';

part 'get_all_return_transactions_cubit.freezed.dart';

class GetAllReturnTransactionsCubit
    extends BaseCubit<GetAllReturnTransactionsState> {
  late TransactionService transactionService;

  GetAllReturnTransactionsCubit({required super.context})
      : super(initialState: GetAllReturnTransactionsState.initial()) {
    transactionService = GetIt.instance<TransactionService>();
    getAllReturnTransactions(createRequestData());
  }

  GetAllReturnTransactionsRequest createRequestData() {
    final request = GetAllReturnTransactionsRequest();
    return request;
  }

  Future<List<GetAllReturnTransactionsResponse>> getAllReturnTransactions(
      GetAllReturnTransactionsRequest request) async {
    return transactionService.getAllReturnTransactions(request).then((value) {
      emit(state.copyWith(
          getAllReturnTransactionsResponse: value,
          getAllReturnTransactionsStatus: BooleanStatus.success));
      return Future.value(value);
    }).catchError((error) {
      emit(state.copyWith(getAllReturnTransactionsStatus: BooleanStatus.error));
      throw error;
    });
  }



  Future<void> launchLocation(String location) async {
    final coords = location.split(','); // Assuming location is in 'latitude,longitude' format
    if (coords.length == 2) {
      final latitude = coords[0];
      final longitude = coords[1];

      final googleMapsUrl = 'https://www.google.com/maps/?q=$latitude,$longitude';
      final appleMapsUrl = 'https://maps.apple.com/?q=$latitude,$longitude';

      if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
        await launchUrl(Uri.parse(googleMapsUrl));
      } else if (await canLaunchUrl(Uri.parse(appleMapsUrl))) {
        await launchUrl(Uri.parse(appleMapsUrl));
      } else {
        throw 'Could not launch map app';
      }
    } else {
      // Handle invalid location format
      throw 'Invalid location format';
    }
  }

}
