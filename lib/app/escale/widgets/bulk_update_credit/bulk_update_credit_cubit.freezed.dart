// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bulk_update_credit_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BulkUpdateCreditState {
  BooleanStatus get bulkUpdateStatus => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BooleanStatus bulkUpdateStatus) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BooleanStatus bulkUpdateStatus)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BooleanStatus bulkUpdateStatus)? initial,
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

  /// Create a copy of BulkUpdateCreditState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BulkUpdateCreditStateCopyWith<BulkUpdateCreditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BulkUpdateCreditStateCopyWith<$Res> {
  factory $BulkUpdateCreditStateCopyWith(BulkUpdateCreditState value,
          $Res Function(BulkUpdateCreditState) then) =
      _$BulkUpdateCreditStateCopyWithImpl<$Res, BulkUpdateCreditState>;
  @useResult
  $Res call({BooleanStatus bulkUpdateStatus});
}

/// @nodoc
class _$BulkUpdateCreditStateCopyWithImpl<$Res,
        $Val extends BulkUpdateCreditState>
    implements $BulkUpdateCreditStateCopyWith<$Res> {
  _$BulkUpdateCreditStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BulkUpdateCreditState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bulkUpdateStatus = null,
  }) {
    return _then(_value.copyWith(
      bulkUpdateStatus: null == bulkUpdateStatus
          ? _value.bulkUpdateStatus
          : bulkUpdateStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $BulkUpdateCreditStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BooleanStatus bulkUpdateStatus});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$BulkUpdateCreditStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of BulkUpdateCreditState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bulkUpdateStatus = null,
  }) {
    return _then(_$InitialImpl(
      bulkUpdateStatus: null == bulkUpdateStatus
          ? _value.bulkUpdateStatus
          : bulkUpdateStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({this.bulkUpdateStatus = BooleanStatus.initial});

  @override
  @JsonKey()
  final BooleanStatus bulkUpdateStatus;

  @override
  String toString() {
    return 'BulkUpdateCreditState.initial(bulkUpdateStatus: $bulkUpdateStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.bulkUpdateStatus, bulkUpdateStatus) ||
                other.bulkUpdateStatus == bulkUpdateStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bulkUpdateStatus);

  /// Create a copy of BulkUpdateCreditState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BooleanStatus bulkUpdateStatus) initial,
  }) {
    return initial(bulkUpdateStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BooleanStatus bulkUpdateStatus)? initial,
  }) {
    return initial?.call(bulkUpdateStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BooleanStatus bulkUpdateStatus)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(bulkUpdateStatus);
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

abstract class _Initial implements BulkUpdateCreditState {
  const factory _Initial({final BooleanStatus bulkUpdateStatus}) =
      _$InitialImpl;

  @override
  BooleanStatus get bulkUpdateStatus;

  /// Create a copy of BulkUpdateCreditState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
