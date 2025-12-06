import 'dart:convert';
import 'dart:io';

import 'package:basic/app/core/api_url/api_url.dart';
import 'package:basic/app/core/logger/log.dart';
import 'package:basic/app/core/network/dio_client.dart';
import 'package:basic/app/escale/request_response/create_return_transaction/create_return_transaction_request.dart';
import 'package:basic/app/escale/request_response/create_return_transaction/create_return_transaction_response.dart';
import 'package:basic/app/escale/request_response/create_transaction/create_transaction_response.dart';
import 'package:basic/app/escale/request_response/delete_transaction/delete_transaction_request.dart';
import 'package:basic/app/escale/request_response/get_all_customers_credit_report/get_all_customers_credit_report_request.dart';
import 'package:basic/app/escale/request_response/get_all_customers_credit_report/get_all_customers_credit_report_response.dart';
import 'package:basic/app/escale/request_response/get_all_return_transactions/get_all_return_transactions_request.dart';
import 'package:basic/app/escale/request_response/get_all_return_transactions/get_all_return_transactions_response.dart';
import 'package:basic/app/escale/request_response/get_all_transactions/get_all_transactions_request.dart';
import 'package:basic/app/escale/request_response/get_all_transactions/get_all_transactions_response.dart';
import 'package:basic/app/escale/request_response/get_collections_by_date/get_collections_by_date_request.dart';
import 'package:basic/app/escale/request_response/get_collections_by_date/get_collections_by_date_response.dart';
import 'package:basic/app/escale/request_response/get_collections_by_date_range/get_collections_by_date_range_request.dart';
import 'package:basic/app/escale/request_response/get_collections_by_date_range/get_collections_by_date_range_response.dart';
import 'package:basic/app/escale/request_response/get_collections_by_month/get_collections_by_month_request.dart';
import 'package:basic/app/escale/request_response/get_collections_by_month/get_collections_by_month_response.dart';
import 'package:basic/app/escale/request_response/get_transactions_by_customer_id/get_transactions_by_customer_id_request.dart';
import 'package:basic/app/escale/request_response/get_transactions_by_customer_id/get_transactions_by_customer_id_response.dart';
import 'package:basic/app/escale/request_response/get_transactions_by_truck_and_customer/get_transactions_by_truck_and_customer_response.dart';
import 'package:basic/app/escale/request_response/update_customer_credit/update_customer_credit_request.dart';
import 'package:basic/app/escale/request_response/update_transaction/update_transaction_request.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../request_response/bulk_update/bulk_update_request.dart';
import '../request_response/create_transaction/create_transaction_request.dart';
import '../request_response/get_transactions_by_truck_and_customer/get_transactions_by_truck_and_customer_request.dart';

part 'transaction_repo.g.dart';

@RestApi()
abstract class TransactionRestClient {
  factory TransactionRestClient(Dio dio, {String baseUrl}) =
      _TransactionRestClient;

  @POST("/transactions")
  Future<CreateTransactionResponse> createTransaction(
      @Body() CreateTransactionRequest createTransactionRequest);

  @GET("/transactions/recent")
  Future<List<GetAllTransactionsResponse>> getRecentTransactions(
      @Queries() Map<String, dynamic> queryMap);

  @GET("/transactions/getCustomerCreditReport")
  Future<List<GetAllCustomersCreditReportResponse>> getAllCustomersCreditReport(
      @Queries() Map<String, dynamic> queryMap);

  @GET("/transactions/getReturnTransactions")
  Future<List<GetAllReturnTransactionsResponse>> getAllReturnTransactions(
      @Queries() Map<String, dynamic> queryMap);

  @GET("/transactions/getCollectionsByDate")
  Future<List<GetCollectionsByDateResponse>> getCollectionsByDate(
      @Queries() Map<String, dynamic> queryMap, @Body() GetCollectionsByDateRequest request);

  @GET("/transactions/getCollectionsByMonth")
  Future<List<GetCollectionsByMonthResponse>> getCollectionsByMonth(
      @Queries() Map<String, dynamic> queryMap, @Body() GetCollectionsByMonthRequest request);

  @GET("/transactions/getCollectionsByDateRange")
  Future<List<GetCollectionsByDateRangeResponse>> getCollectionsByDateRange(
      @Queries() Map<String, dynamic> queryMap, @Body() GetCollectionsByDateRangeRequest request);

  @GET(
      "/transactions/findListByDateTruckCustomer?dt={date}&truck={truckid}&customer={customerid}")
  Future<List<GetAllTransactionsResponse>> getTransactionsByDateTruckCustomer(
    @Path('date') String date,
    @Path('truckid') String truckid,
    @Path('customerid') String customerid,
  );

  @GET(
      "/transactions/findByTruckAndCustomer?customerid={customerid}&truckid={truckid}")
  Future<List<GetTransactionsByTruckAndCustomerResponse>>
      getTransactionsByTruckAndCustomer(@Path('customerid') String customerid,
          @Path('truckid') String truckid);

  @GET("/transactions/findByCustomer/{customerid}")
  Future<List<GetTransactionsByCustomerIdResponse>> getTransactionsByCustomerId(
      @Path('customerid') String customerid);

  @GET("/transactions/findByDate?dt={date}")
  Future<List<GetAllTransactionsResponse>> getTransactionsByDate(
      @Path('date') String date);

  @PUT("/transactions/{transactionid}")
  Future<void> updateTransaction(@Body() UpdateTransactionRequest request,
      @Path('transactionid') String transactionid);

  @PUT("/transactions/bulkConvertToCash")
  Future<void> bulkUpdateCash(@Body() BulkUpdateRequest request);

  @PUT("/transactions/bulkConvertToCredit")
  Future<void> bulkUpdateCredit(@Body() BulkUpdateRequest request);

  @PUT("/transactions/bulkUpdatePrice")
  Future<void> bulkUpdatePrice(@Body() BulkUpdateRequest request);

  @PUT("/transactions/updateCustomerCredit")
  Future<void> updateCustomerCredit(@Body() UpdateCustomerCreditRequest request);

  @POST("/transactions/createReturnTransaction")
  @MultiPart()
  Future<CreateReturnTransactionResponse> createReturnTransaction(
      @Part() int customerId,
      @Part() int amountReturned,
      @Part() String returnType,
      @Part() String latitude,
      @Part() String longitude,
      @Part() List<File> files);

  @DELETE("/transactions/{transactionid}")
  Future<void> deleteTransaction(@Body() DeleteTransactionRequest request,
      @Path('transactionid') String transactionid);
}

@singleton
class TransactionRepo extends RestService {
  late TransactionRestClient transactionRestClient;

  TransactionRepo() : super() {
    this.transactionRestClient =
        TransactionRestClient(getDioClient(), baseUrl: ApiUrl.url);
  }

  Future<CreateTransactionResponse> createTransaction(
      CreateTransactionRequest request) {
    return transactionRestClient.createTransaction(request);
  }

  Future<List<GetAllTransactionsResponse>> getRecentTransactions(
      GetAllTransactionsRequest request) {
    return transactionRestClient.getRecentTransactions(request.toJson());
  }

  Future<List<GetAllCustomersCreditReportResponse>> getAllCustomersCreditReport(
      GetAllCustomersCreditReportRequest request) {
    return transactionRestClient.getAllCustomersCreditReport(request.toJson());
  }

  Future<List<GetAllReturnTransactionsResponse>> getAllReturnTransactions(
      GetAllReturnTransactionsRequest request) {
    return transactionRestClient.getAllReturnTransactions(request.toJson());
  }

  Future<List<GetCollectionsByDateResponse>> getCollectionsByDate(
      GetCollectionsByDateRequest request) {
    return transactionRestClient.getCollectionsByDate(request.toJson(), request);
  }

  Future<List<GetCollectionsByMonthResponse>> getCollectionsByMonth(
      GetCollectionsByMonthRequest request) {
    return transactionRestClient.getCollectionsByMonth(request.toJson(), request);
  }

  Future<List<GetCollectionsByDateRangeResponse>> getCollectionsByDateRange(
      GetCollectionsByDateRangeRequest request) {
    return transactionRestClient.getCollectionsByDateRange(request.toJson(), request);
  }

  Future<List<GetAllTransactionsResponse>> getTransactionsByDateTruckCustomer(
      GetAllTransactionsRequest request) {
    return transactionRestClient.getTransactionsByDateTruckCustomer(
        request.date.toString(),
        request.truckid.toString(),
        request.customerid.toString());
  }

  Future<List<GetTransactionsByTruckAndCustomerResponse>>
      getTransactionsByTruckAndCustomer(
          GetTransactionsByTruckAndCustomerRequest request) {
    return transactionRestClient.getTransactionsByTruckAndCustomer(
        request.customerid.toString(), request.truckid.toString());
  }

  Future<List<GetTransactionsByCustomerIdResponse>> getTransactionsByCustomerId(
      GetTransactionsByCustomerIdRequest request) {
    return transactionRestClient
        .getTransactionsByCustomerId(request.customerid.toString());
  }

  Future<List<GetAllTransactionsResponse>> getTransactionsByDate(
      GetAllTransactionsRequest request) {
    return transactionRestClient.getTransactionsByDate(request.date.toString());
  }

  Future<void> updateTransaction(UpdateTransactionRequest request) {
    return transactionRestClient.updateTransaction(
        request, request.transactionid.toString());
  }

  Future<void> bulkUpdateCash(BulkUpdateRequest request) {
    return transactionRestClient.bulkUpdateCash(request);
  }

  Future<void> bulkUpdateCredit(BulkUpdateRequest request) {
    return transactionRestClient.bulkUpdateCredit(request);
  }

  Future<void> bulkUpdatePrice(BulkUpdateRequest request) {
    return transactionRestClient.bulkUpdatePrice(request);
  }

  Future<void> updateCustomerCredit(UpdateCustomerCreditRequest request) {
    return transactionRestClient.updateCustomerCredit(request);
  }

  Future<CreateReturnTransactionResponse> createReturnTransaction(CreateReturnTransactionRequest request) {
    return transactionRestClient.createReturnTransaction(
        request.customerId!,
        request.amountReturned!,
        request.returnType!,
        request.latitude!,
        request.longitude!,
        request.files!);
  }


  Future<void> deleteTransaction(DeleteTransactionRequest request) {
    return transactionRestClient.deleteTransaction(
        request, request.transactionid.toString());
  }
}
