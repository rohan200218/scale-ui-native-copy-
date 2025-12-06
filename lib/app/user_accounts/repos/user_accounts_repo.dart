import 'package:basic/app/core/api_url/api_url.dart';
import 'package:basic/app/core/network/dio_client.dart';
import 'package:basic/app/user_accounts/request_response/user_signup/user_signup_request.dart';
import 'package:basic/app/user_accounts/request_response/user_signup/user_signup_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../request_response/user_login/user_login_request.dart';
import '../request_response/user_login/user_login_response.dart';



part 'user_accounts_repo.g.dart';


@RestApi()
abstract class UserAccountsRestClient {
  factory UserAccountsRestClient(Dio dio,
      {String baseUrl}) = _UserAccountsRestClient;

  @POST("/auth/signin")
  Future<UserLoginResponse> login(@Body() UserLoginRequest userLoginRequest);

  @POST("/auth/signup")
  Future<UserSignupResponse> signUp(@Body() UserSignupRequest userSignupRequest);

}


@singleton
class UserAccountRepo extends RestService {
  late UserAccountsRestClient userAccountsRestClient;

  UserAccountRepo() : super() {
    this.userAccountsRestClient =
        UserAccountsRestClient(getDioClient(), baseUrl: ApiUrl.url);
  }

  Future<UserLoginResponse> login(UserLoginRequest userLoginRequest) {
    return userAccountsRestClient.login(userLoginRequest);
  }

  Future<UserSignupResponse> signUp(UserSignupRequest userSignupRequest) {
    return userAccountsRestClient.signUp(userSignupRequest);
  }


}
