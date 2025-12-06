part of 'user_account_signup_form_cubit.dart';

@freezed
class UserAccountSignupFormState with _$UserAccountSignupFormState {
  const factory UserAccountSignupFormState.initial({
    ControlStatus? formValid,
    UserSignupResponse? userSignupResponse,
    @Default(BooleanStatus.initial) BooleanStatus userSignupStatus,
  }) = _Initial;
}
