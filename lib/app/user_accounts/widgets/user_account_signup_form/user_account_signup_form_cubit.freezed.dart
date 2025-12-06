// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_account_signup_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserAccountSignupFormState {
  ControlStatus? get formValid => throw _privateConstructorUsedError;
  UserSignupResponse? get userSignupResponse =>
      throw _privateConstructorUsedError;
  BooleanStatus get userSignupStatus => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ControlStatus? formValid,
            UserSignupResponse? userSignupResponse,
            BooleanStatus userSignupStatus)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            ControlStatus? formValid,
            UserSignupResponse? userSignupResponse,
            BooleanStatus userSignupStatus)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            ControlStatus? formValid,
            UserSignupResponse? userSignupResponse,
            BooleanStatus userSignupStatus)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of UserAccountSignupFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAccountSignupFormStateCopyWith<UserAccountSignupFormState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAccountSignupFormStateCopyWith<$Res> {
  factory $UserAccountSignupFormStateCopyWith(UserAccountSignupFormState value,
          $Res Function(UserAccountSignupFormState) then) =
      _$UserAccountSignupFormStateCopyWithImpl<$Res,
          UserAccountSignupFormState>;
  @useResult
  $Res call(
      {ControlStatus? formValid,
      UserSignupResponse? userSignupResponse,
      BooleanStatus userSignupStatus});
}

/// @nodoc
class _$UserAccountSignupFormStateCopyWithImpl<$Res,
        $Val extends UserAccountSignupFormState>
    implements $UserAccountSignupFormStateCopyWith<$Res> {
  _$UserAccountSignupFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAccountSignupFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formValid = freezed,
    Object? userSignupResponse = freezed,
    Object? userSignupStatus = null,
  }) {
    return _then(_value.copyWith(
      formValid: freezed == formValid
          ? _value.formValid
          : formValid // ignore: cast_nullable_to_non_nullable
              as ControlStatus?,
      userSignupResponse: freezed == userSignupResponse
          ? _value.userSignupResponse
          : userSignupResponse // ignore: cast_nullable_to_non_nullable
              as UserSignupResponse?,
      userSignupStatus: null == userSignupStatus
          ? _value.userSignupStatus
          : userSignupStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $UserAccountSignupFormStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ControlStatus? formValid,
      UserSignupResponse? userSignupResponse,
      BooleanStatus userSignupStatus});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$UserAccountSignupFormStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAccountSignupFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formValid = freezed,
    Object? userSignupResponse = freezed,
    Object? userSignupStatus = null,
  }) {
    return _then(_$InitialImpl(
      formValid: freezed == formValid
          ? _value.formValid
          : formValid // ignore: cast_nullable_to_non_nullable
              as ControlStatus?,
      userSignupResponse: freezed == userSignupResponse
          ? _value.userSignupResponse
          : userSignupResponse // ignore: cast_nullable_to_non_nullable
              as UserSignupResponse?,
      userSignupStatus: null == userSignupStatus
          ? _value.userSignupStatus
          : userSignupStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.formValid,
      this.userSignupResponse,
      this.userSignupStatus = BooleanStatus.initial});

  @override
  final ControlStatus? formValid;
  @override
  final UserSignupResponse? userSignupResponse;
  @override
  @JsonKey()
  final BooleanStatus userSignupStatus;

  @override
  String toString() {
    return 'UserAccountSignupFormState.initial(formValid: $formValid, userSignupResponse: $userSignupResponse, userSignupStatus: $userSignupStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.formValid, formValid) ||
                other.formValid == formValid) &&
            (identical(other.userSignupResponse, userSignupResponse) ||
                other.userSignupResponse == userSignupResponse) &&
            (identical(other.userSignupStatus, userSignupStatus) ||
                other.userSignupStatus == userSignupStatus));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, formValid, userSignupResponse, userSignupStatus);

  /// Create a copy of UserAccountSignupFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ControlStatus? formValid,
            UserSignupResponse? userSignupResponse,
            BooleanStatus userSignupStatus)
        initial,
  }) {
    return initial(formValid, userSignupResponse, userSignupStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            ControlStatus? formValid,
            UserSignupResponse? userSignupResponse,
            BooleanStatus userSignupStatus)?
        initial,
  }) {
    return initial?.call(formValid, userSignupResponse, userSignupStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            ControlStatus? formValid,
            UserSignupResponse? userSignupResponse,
            BooleanStatus userSignupStatus)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(formValid, userSignupResponse, userSignupStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements UserAccountSignupFormState {
  const factory _Initial(
      {final ControlStatus? formValid,
      final UserSignupResponse? userSignupResponse,
      final BooleanStatus userSignupStatus}) = _$InitialImpl;

  @override
  ControlStatus? get formValid;
  @override
  UserSignupResponse? get userSignupResponse;
  @override
  BooleanStatus get userSignupStatus;

  /// Create a copy of UserAccountSignupFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
