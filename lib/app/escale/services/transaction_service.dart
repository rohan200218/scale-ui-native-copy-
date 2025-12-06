import 'package:basic/app/core/logger/log.dart';
import 'package:basic/app/escale/request_response/create_return_transaction/create_return_transaction_request.dart';
import 'package:basic/app/escale/request_response/create_return_transaction/create_return_transaction_response.dart';
import 'package:basic/app/escale/request_response/create_transaction/create_transaction_response.dart';
import 'package:basic/app/escale/request_response/delete_transaction/delete_transaction_request.dart';
import 'package:basic/app/escale/request_response/get_all_customers_credit_report/get_all_customers_credit_report_request.dart';
import 'package:basic/app/escale/request_response/get_all_customers_credit_report/get_all_customers_credit_report_response.dart';
import 'package:basic/app/escale/request_response/get_all_return_transactions/get_all_return_transactions_request.dart';
import 'package:basic/app/escale/request_response/get_all_return_transactions/get_all_return_transactions_response.dart';
import 'package:basic/app/escale/request_response/get_all_transactions/get_all_transactions_response.dart';
import 'package:basic/app/escale/request_response/get_collections_by_date/get_collections_by_date_request.dart';
import 'package:basic/app/escale/request_response/get_collections_by_date/get_collections_by_date_response.dart';
import 'package:basic/app/escale/request_response/get_collections_by_date_range/get_collections_by_date_range_request.dart';
import 'package:basic/app/escale/request_response/get_collections_by_date_range/get_collections_by_date_range_response.dart';
import 'package:basic/app/escale/request_response/get_collections_by_month/get_collections_by_month_request.dart';
import 'package:basic/app/escale/request_response/get_collections_by_month/get_collections_by_month_response.dart';
import 'package:basic/app/escale/request_response/get_transactions_by_customer_id/get_transactions_by_customer_id_request.dart';
import 'package:basic/app/escale/request_response/get_transactions_by_customer_id/get_transactions_by_customer_id_response.dart';
import 'package:basic/app/escale/request_response/get_transactions_by_truck_and_customer/get_transactions_by_truck_and_customer_request.dart';
import 'package:basic/app/escale/request_response/get_transactions_by_truck_and_customer/get_transactions_by_truck_and_customer_response.dart';
import 'package:basic/app/escale/request_response/update_customer_credit/update_customer_credit_request.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../repos/transaction_repo.dart';
import '../request_response/bulk_update/bulk_update_request.dart';
import '../request_response/create_transaction/create_transaction_request.dart';
import '../request_response/get_all_transactions/get_all_transactions_request.dart';
import '../request_response/update_transaction/update_transaction_request.dart';


@singleton
class TransactionService {
  late TransactionRepo transactionRepo;

  TransactionService() {
    transactionRepo = GetIt.instance<TransactionRepo>();
  }

  Future<CreateTransactionResponse> createTransaction(CreateTransactionRequest request) {
    return transactionRepo.createTransaction(request);
  }

  Future<List<GetAllTransactionsResponse>> getRecentTransactions(GetAllTransactionsRequest request) {
    return transactionRepo.getRecentTransactions(request);
  }

  Future<List<GetAllCustomersCreditReportResponse>> getAllCustomersCreditReport(GetAllCustomersCreditReportRequest request) {
    return transactionRepo.getAllCustomersCreditReport(request);
  }

  Future<List<GetAllReturnTransactionsResponse>> getAllReturnTransactions(GetAllReturnTransactionsRequest request) {
    return transactionRepo.getAllReturnTransactions(request);
  }

  Future<List<GetCollectionsByDateResponse>> getCollectionsByDate(GetCollectionsByDateRequest request) {
    return transactionRepo.getCollectionsByDate(request);
  }

  Future<List<GetCollectionsByMonthResponse>> getCollectionsByMonth(GetCollectionsByMonthRequest request) {
    return transactionRepo.getCollectionsByMonth(request);
  }

  Future<List<GetCollectionsByDateRangeResponse>> getCollectionsByDateRange(GetCollectionsByDateRangeRequest request) {
    return transactionRepo.getCollectionsByDateRange(request);
  }

  Future<List<GetAllTransactionsResponse>> getTransactionsByDateTruckCustomer(GetAllTransactionsRequest request) {
    return transactionRepo.getTransactionsByDateTruckCustomer(request);
  }

  Future<List<GetAllTransactionsResponse>> getTransactionsByDate(GetAllTransactionsRequest request) {
    return transactionRepo.getTransactionsByDate(request);
  }

  Future<List<GetTransactionsByTruckAndCustomerResponse>> getTransactionsByTruckAndCustomer(GetTransactionsByTruckAndCustomerRequest request) {
    return transactionRepo.getTransactionsByTruckAndCustomer(request);
  }

  Future<List<GetTransactionsByCustomerIdResponse>> getTransactionsByCustomerId(GetTransactionsByCustomerIdRequest request) {
    return transactionRepo.getTransactionsByCustomerId(request);
  }

  Future<void> bulkUpdateCash(BulkUpdateRequest request) {
    return transactionRepo.bulkUpdateCash(request);
  }

  Future<void> bulkUpdateCredit(BulkUpdateRequest request) {
    return transactionRepo.bulkUpdateCredit(request);
  }

  Future<void> bulkUpdatePrice(BulkUpdateRequest request) {
    return transactionRepo.bulkUpdatePrice(request);
  }

  Future<void> updateTransaction(UpdateTransactionRequest request) {
    return transactionRepo.updateTransaction(request);
  }

  Future<void> updateCustomerCredit(UpdateCustomerCreditRequest request) {
    return transactionRepo.updateCustomerCredit(request);
  }

  Future<CreateReturnTransactionResponse> createReturnTransaction(CreateReturnTransactionRequest request) {
    return transactionRepo.createReturnTransaction(request);
  }

  Future<void> deleteTransaction(DeleteTransactionRequest request) {
    return transactionRepo.deleteTransaction(request);
  }
}
