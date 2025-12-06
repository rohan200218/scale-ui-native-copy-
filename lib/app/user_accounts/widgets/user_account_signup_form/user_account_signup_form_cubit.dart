import 'package:basic/app/user_accounts/request_response/user_signup/user_signup_request.dart';
import 'package:basic/app/user_accounts/request_response/user_signup/user_signup_response.dart';
import 'package:basic/app/user_accounts/services/user_account_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'user_account_signup_form_state.dart';

part 'user_account_signup_form_cubit.freezed.dart';

class UserAccountSignupFormCubit
    extends BaseFormCubit<UserAccountSignupFormState> {
  late UserAccountService userAccountService;
  UserAccountSignupFormCubit({required super.context})
      : super(initialState: UserAccountSignupFormState.initial()){
    userAccountService=GetIt.instance<UserAccountService>();
  }

    UserSignupRequest createRequestData({
      String? username,
      String? email,
      String? password
    }) {
        final request = UserSignupRequest(
            username: username ?? formGroup.control('username').value,
            email: email ?? formGroup.control('email').value,
            password: password ?? formGroup.control('password').value
        );
        return request;
      }

    Future<UserSignupResponse> signUp(
          UserSignupRequest request) async {
        return userAccountService.signUp(request).then((value) {
          emit(state.copyWith(
              userSignupResponse: value,
              userSignupStatus: BooleanStatus.success));
          showSuccessMessage("User Registered Successfully");
          return Future.value(value);
        }).catchError((error) {
          emit(state.copyWith(userSignupStatus: BooleanStatus.error));
          throw error;
        });
      }

  @override
  FormGroup getFormGroup() {
    return FormGroup({
      'username': FormControl<String>(validators: [Validators.required]),
      'email': FormControl<String>(validators: [Validators.required]),
      'password': FormControl<String>(validators: [Validators.required]),
    });
  }

  @override
  void updateFormValidationState(ControlStatus event) {
    emit(state.copyWith(formValid: event));
  }
}
