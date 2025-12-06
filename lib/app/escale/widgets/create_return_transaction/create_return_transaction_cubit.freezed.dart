// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_return_transaction_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateReturnTransactionState {
  CreateReturnTransactionResponse? get createReturnTransactionResponse =>
      throw _privateConstructorUsedError;
  BooleanStatus get createReturnTransactionStatus =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CreateReturnTransactionResponse? createReturnTransactionResponse,
            BooleanStatus createReturnTransactionStatus)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CreateReturnTransactionResponse? createReturnTransactionResponse,
            BooleanStatus createReturnTransactionStatus)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CreateReturnTransactionResponse? createReturnTransactionResponse,
            BooleanStatus createReturnTransactionStatus)?
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

  /// Create a copy of CreateReturnTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateReturnTransactionStateCopyWith<CreateReturnTransactionState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateReturnTransactionStateCopyWith<$Res> {
  factory $CreateReturnTransactionStateCopyWith(
          CreateReturnTransactionState value,
          $Res Function(CreateReturnTransactionState) then) =
      _$CreateReturnTransactionStateCopyWithImpl<$Res,
          CreateReturnTransactionState>;
  @useResult
  $Res call(
      {CreateReturnTransactionResponse? createReturnTransactionResponse,
      BooleanStatus createReturnTransactionStatus});
}

/// @nodoc
class _$CreateReturnTransactionStateCopyWithImpl<$Res,
        $Val extends CreateReturnTransactionState>
    implements $CreateReturnTransactionStateCopyWith<$Res> {
  _$CreateReturnTransactionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateReturnTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createReturnTransactionResponse = freezed,
    Object? createReturnTransactionStatus = null,
  }) {
    return _then(_value.copyWith(
      createReturnTransactionResponse: freezed ==
              createReturnTransactionResponse
          ? _value.createReturnTransactionResponse
          : createReturnTransactionResponse // ignore: cast_nullable_to_non_nullable
              as CreateReturnTransactionResponse?,
      createReturnTransactionStatus: null == createReturnTransactionStatus
          ? _value.createReturnTransactionStatus
          : createReturnTransactionStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $CreateReturnTransactionStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CreateReturnTransactionResponse? createReturnTransactionResponse,
      BooleanStatus createReturnTransactionStatus});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CreateReturnTransactionStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateReturnTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createReturnTransactionResponse = freezed,
    Object? createReturnTransactionStatus = null,
  }) {
    return _then(_$InitialImpl(
      createReturnTransactionResponse: freezed ==
              createReturnTransactionResponse
          ? _value.createReturnTransactionResponse
          : createReturnTransactionResponse // ignore: cast_nullable_to_non_nullable
              as CreateReturnTransactionResponse?,
      createReturnTransactionStatus: null == createReturnTransactionStatus
          ? _value.createReturnTransactionStatus
          : createReturnTransactionStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.createReturnTransactionResponse,
      this.createReturnTransactionStatus = BooleanStatus.initial});

  @override
  final CreateReturnTransactionResponse? createReturnTransactionResponse;
  @override
  @JsonKey()
  final BooleanStatus createReturnTransactionStatus;

  @override
  String toString() {
    return 'CreateReturnTransactionState.initial(createReturnTransactionResponse: $createReturnTransactionResponse, createReturnTransactionStatus: $createReturnTransactionStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.createReturnTransactionResponse,
                    createReturnTransactionResponse) ||
                other.createReturnTransactionResponse ==
                    createReturnTransactionResponse) &&
            (identical(other.createReturnTransactionStatus,
                    createReturnTransactionStatus) ||
                other.createReturnTransactionStatus ==
                    createReturnTransactionStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, createReturnTransactionResponse,
      createReturnTransactionStatus);

  /// Create a copy of CreateReturnTransactionState
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
            CreateReturnTransactionResponse? createReturnTransactionResponse,
            BooleanStatus createReturnTransactionStatus)
        initial,
  }) {
    return initial(
        createReturnTransactionResponse, createReturnTransactionStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CreateReturnTransactionResponse? createReturnTransactionResponse,
            BooleanStatus createReturnTransactionStatus)?
        initial,
  }) {
    return initial?.call(
        createReturnTransactionResponse, createReturnTransactionStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CreateReturnTransactionResponse? createReturnTransactionResponse,
            BooleanStatus createReturnTransactionStatus)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          createReturnTransactionResponse, createReturnTransactionStatus);
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

abstract class _Initial implements CreateReturnTransactionState {
  const factory _Initial(
      {final CreateReturnTransactionResponse? createReturnTransactionResponse,
      final BooleanStatus createReturnTransactionStatus}) = _$InitialImpl;

  @override
  CreateReturnTransactionResponse? get createReturnTransactionResponse;
  @override
  BooleanStatus get createReturnTransactionStatus;

  /// Create a copy of CreateReturnTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
