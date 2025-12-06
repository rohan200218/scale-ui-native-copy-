// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bulk_update_cash_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BulkUpdateCashState {
  BooleanStatus get bulkUpdateCashStatus => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BooleanStatus bulkUpdateCashStatus) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BooleanStatus bulkUpdateCashStatus)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BooleanStatus bulkUpdateCashStatus)? initial,
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

  /// Create a copy of BulkUpdateCashState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BulkUpdateCashStateCopyWith<BulkUpdateCashState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BulkUpdateCashStateCopyWith<$Res> {
  factory $BulkUpdateCashStateCopyWith(
          BulkUpdateCashState value, $Res Function(BulkUpdateCashState) then) =
      _$BulkUpdateCashStateCopyWithImpl<$Res, BulkUpdateCashState>;
  @useResult
  $Res call({BooleanStatus bulkUpdateCashStatus});
}

/// @nodoc
class _$BulkUpdateCashStateCopyWithImpl<$Res, $Val extends BulkUpdateCashState>
    implements $BulkUpdateCashStateCopyWith<$Res> {
  _$BulkUpdateCashStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BulkUpdateCashState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bulkUpdateCashStatus = null,
  }) {
    return _then(_value.copyWith(
      bulkUpdateCashStatus: null == bulkUpdateCashStatus
          ? _value.bulkUpdateCashStatus
          : bulkUpdateCashStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $BulkUpdateCashStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BooleanStatus bulkUpdateCashStatus});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$BulkUpdateCashStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of BulkUpdateCashState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bulkUpdateCashStatus = null,
  }) {
    return _then(_$InitialImpl(
      bulkUpdateCashStatus: null == bulkUpdateCashStatus
          ? _value.bulkUpdateCashStatus
          : bulkUpdateCashStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({this.bulkUpdateCashStatus = BooleanStatus.initial});

  @override
  @JsonKey()
  final BooleanStatus bulkUpdateCashStatus;

  @override
  String toString() {
    return 'BulkUpdateCashState.initial(bulkUpdateCashStatus: $bulkUpdateCashStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.bulkUpdateCashStatus, bulkUpdateCashStatus) ||
                other.bulkUpdateCashStatus == bulkUpdateCashStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bulkUpdateCashStatus);

  /// Create a copy of BulkUpdateCashState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BooleanStatus bulkUpdateCashStatus) initial,
  }) {
    return initial(bulkUpdateCashStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BooleanStatus bulkUpdateCashStatus)? initial,
  }) {
    return initial?.call(bulkUpdateCashStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BooleanStatus bulkUpdateCashStatus)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(bulkUpdateCashStatus);
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

abstract class _Initial implements BulkUpdateCashState {
  const factory _Initial({final BooleanStatus bulkUpdateCashStatus}) =
      _$InitialImpl;

  @override
  BooleanStatus get bulkUpdateCashStatus;

  /// Create a copy of BulkUpdateCashState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
