// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_return_transaction_popup_content_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeleteReturnTransactionPopupContentState {
  bool? get loadingButton => throw _privateConstructorUsedError;
  int? get transactionid => throw _privateConstructorUsedError;
  BooleanStatus get deleteTransactionStatus =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool? loadingButton, int? transactionid,
            BooleanStatus deleteTransactionStatus)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool? loadingButton, int? transactionid,
            BooleanStatus deleteTransactionStatus)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool? loadingButton, int? transactionid,
            BooleanStatus deleteTransactionStatus)?
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

  /// Create a copy of DeleteReturnTransactionPopupContentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeleteReturnTransactionPopupContentStateCopyWith<
          DeleteReturnTransactionPopupContentState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteReturnTransactionPopupContentStateCopyWith<$Res> {
  factory $DeleteReturnTransactionPopupContentStateCopyWith(
          DeleteReturnTransactionPopupContentState value,
          $Res Function(DeleteReturnTransactionPopupContentState) then) =
      _$DeleteReturnTransactionPopupContentStateCopyWithImpl<$Res,
          DeleteReturnTransactionPopupContentState>;
  @useResult
  $Res call(
      {bool? loadingButton,
      int? transactionid,
      BooleanStatus deleteTransactionStatus});
}

/// @nodoc
class _$DeleteReturnTransactionPopupContentStateCopyWithImpl<$Res,
        $Val extends DeleteReturnTransactionPopupContentState>
    implements $DeleteReturnTransactionPopupContentStateCopyWith<$Res> {
  _$DeleteReturnTransactionPopupContentStateCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeleteReturnTransactionPopupContentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingButton = freezed,
    Object? transactionid = freezed,
    Object? deleteTransactionStatus = null,
  }) {
    return _then(_value.copyWith(
      loadingButton: freezed == loadingButton
          ? _value.loadingButton
          : loadingButton // ignore: cast_nullable_to_non_nullable
              as bool?,
      transactionid: freezed == transactionid
          ? _value.transactionid
          : transactionid // ignore: cast_nullable_to_non_nullable
              as int?,
      deleteTransactionStatus: null == deleteTransactionStatus
          ? _value.deleteTransactionStatus
          : deleteTransactionStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $DeleteReturnTransactionPopupContentStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? loadingButton,
      int? transactionid,
      BooleanStatus deleteTransactionStatus});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$DeleteReturnTransactionPopupContentStateCopyWithImpl<$Res,
        _$InitialImpl> implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteReturnTransactionPopupContentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingButton = freezed,
    Object? transactionid = freezed,
    Object? deleteTransactionStatus = null,
  }) {
    return _then(_$InitialImpl(
      loadingButton: freezed == loadingButton
          ? _value.loadingButton
          : loadingButton // ignore: cast_nullable_to_non_nullable
              as bool?,
      transactionid: freezed == transactionid
          ? _value.transactionid
          : transactionid // ignore: cast_nullable_to_non_nullable
              as int?,
      deleteTransactionStatus: null == deleteTransactionStatus
          ? _value.deleteTransactionStatus
          : deleteTransactionStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.loadingButton,
      this.transactionid,
      this.deleteTransactionStatus = BooleanStatus.initial});

  @override
  final bool? loadingButton;
  @override
  final int? transactionid;
  @override
  @JsonKey()
  final BooleanStatus deleteTransactionStatus;

  @override
  String toString() {
    return 'DeleteReturnTransactionPopupContentState.initial(loadingButton: $loadingButton, transactionid: $transactionid, deleteTransactionStatus: $deleteTransactionStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.loadingButton, loadingButton) ||
                other.loadingButton == loadingButton) &&
            (identical(other.transactionid, transactionid) ||
                other.transactionid == transactionid) &&
            (identical(
                    other.deleteTransactionStatus, deleteTransactionStatus) ||
                other.deleteTransactionStatus == deleteTransactionStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, loadingButton, transactionid, deleteTransactionStatus);

  /// Create a copy of DeleteReturnTransactionPopupContentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool? loadingButton, int? transactionid,
            BooleanStatus deleteTransactionStatus)
        initial,
  }) {
    return initial(loadingButton, transactionid, deleteTransactionStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool? loadingButton, int? transactionid,
            BooleanStatus deleteTransactionStatus)?
        initial,
  }) {
    return initial?.call(loadingButton, transactionid, deleteTransactionStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool? loadingButton, int? transactionid,
            BooleanStatus deleteTransactionStatus)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(loadingButton, transactionid, deleteTransactionStatus);
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

abstract class _Initial implements DeleteReturnTransactionPopupContentState {
  const factory _Initial(
      {final bool? loadingButton,
      final int? transactionid,
      final BooleanStatus deleteTransactionStatus}) = _$InitialImpl;

  @override
  bool? get loadingButton;
  @override
  int? get transactionid;
  @override
  BooleanStatus get deleteTransactionStatus;

  /// Create a copy of DeleteReturnTransactionPopupContentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
