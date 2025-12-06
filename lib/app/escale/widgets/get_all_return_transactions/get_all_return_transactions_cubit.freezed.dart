// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_return_transactions_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetAllReturnTransactionsState {
  List<GetAllReturnTransactionsResponse>?
      get getAllReturnTransactionsResponse =>
          throw _privateConstructorUsedError;
  BooleanStatus get getAllReturnTransactionsStatus =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<GetAllReturnTransactionsResponse>?
                getAllReturnTransactionsResponse,
            BooleanStatus getAllReturnTransactionsStatus)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<GetAllReturnTransactionsResponse>?
                getAllReturnTransactionsResponse,
            BooleanStatus getAllReturnTransactionsStatus)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<GetAllReturnTransactionsResponse>?
                getAllReturnTransactionsResponse,
            BooleanStatus getAllReturnTransactionsStatus)?
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

  /// Create a copy of GetAllReturnTransactionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetAllReturnTransactionsStateCopyWith<GetAllReturnTransactionsState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllReturnTransactionsStateCopyWith<$Res> {
  factory $GetAllReturnTransactionsStateCopyWith(
          GetAllReturnTransactionsState value,
          $Res Function(GetAllReturnTransactionsState) then) =
      _$GetAllReturnTransactionsStateCopyWithImpl<$Res,
          GetAllReturnTransactionsState>;
  @useResult
  $Res call(
      {List<GetAllReturnTransactionsResponse>? getAllReturnTransactionsResponse,
      BooleanStatus getAllReturnTransactionsStatus});
}

/// @nodoc
class _$GetAllReturnTransactionsStateCopyWithImpl<$Res,
        $Val extends GetAllReturnTransactionsState>
    implements $GetAllReturnTransactionsStateCopyWith<$Res> {
  _$GetAllReturnTransactionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetAllReturnTransactionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getAllReturnTransactionsResponse = freezed,
    Object? getAllReturnTransactionsStatus = null,
  }) {
    return _then(_value.copyWith(
      getAllReturnTransactionsResponse: freezed ==
              getAllReturnTransactionsResponse
          ? _value.getAllReturnTransactionsResponse
          : getAllReturnTransactionsResponse // ignore: cast_nullable_to_non_nullable
              as List<GetAllReturnTransactionsResponse>?,
      getAllReturnTransactionsStatus: null == getAllReturnTransactionsStatus
          ? _value.getAllReturnTransactionsStatus
          : getAllReturnTransactionsStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $GetAllReturnTransactionsStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<GetAllReturnTransactionsResponse>? getAllReturnTransactionsResponse,
      BooleanStatus getAllReturnTransactionsStatus});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$GetAllReturnTransactionsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAllReturnTransactionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getAllReturnTransactionsResponse = freezed,
    Object? getAllReturnTransactionsStatus = null,
  }) {
    return _then(_$InitialImpl(
      getAllReturnTransactionsResponse: freezed ==
              getAllReturnTransactionsResponse
          ? _value._getAllReturnTransactionsResponse
          : getAllReturnTransactionsResponse // ignore: cast_nullable_to_non_nullable
              as List<GetAllReturnTransactionsResponse>?,
      getAllReturnTransactionsStatus: null == getAllReturnTransactionsStatus
          ? _value.getAllReturnTransactionsStatus
          : getAllReturnTransactionsStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {final List<GetAllReturnTransactionsResponse>?
          getAllReturnTransactionsResponse,
      this.getAllReturnTransactionsStatus = BooleanStatus.initial})
      : _getAllReturnTransactionsResponse = getAllReturnTransactionsResponse;

  final List<GetAllReturnTransactionsResponse>?
      _getAllReturnTransactionsResponse;
  @override
  List<GetAllReturnTransactionsResponse>? get getAllReturnTransactionsResponse {
    final value = _getAllReturnTransactionsResponse;
    if (value == null) return null;
    if (_getAllReturnTransactionsResponse is EqualUnmodifiableListView)
      return _getAllReturnTransactionsResponse;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final BooleanStatus getAllReturnTransactionsStatus;

  @override
  String toString() {
    return 'GetAllReturnTransactionsState.initial(getAllReturnTransactionsResponse: $getAllReturnTransactionsResponse, getAllReturnTransactionsStatus: $getAllReturnTransactionsStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality().equals(
                other._getAllReturnTransactionsResponse,
                _getAllReturnTransactionsResponse) &&
            (identical(other.getAllReturnTransactionsStatus,
                    getAllReturnTransactionsStatus) ||
                other.getAllReturnTransactionsStatus ==
                    getAllReturnTransactionsStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_getAllReturnTransactionsResponse),
      getAllReturnTransactionsStatus);

  /// Create a copy of GetAllReturnTransactionsState
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
            List<GetAllReturnTransactionsResponse>?
                getAllReturnTransactionsResponse,
            BooleanStatus getAllReturnTransactionsStatus)
        initial,
  }) {
    return initial(
        getAllReturnTransactionsResponse, getAllReturnTransactionsStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<GetAllReturnTransactionsResponse>?
                getAllReturnTransactionsResponse,
            BooleanStatus getAllReturnTransactionsStatus)?
        initial,
  }) {
    return initial?.call(
        getAllReturnTransactionsResponse, getAllReturnTransactionsStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<GetAllReturnTransactionsResponse>?
                getAllReturnTransactionsResponse,
            BooleanStatus getAllReturnTransactionsStatus)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          getAllReturnTransactionsResponse, getAllReturnTransactionsStatus);
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

abstract class _Initial implements GetAllReturnTransactionsState {
  const factory _Initial(
      {final List<GetAllReturnTransactionsResponse>?
          getAllReturnTransactionsResponse,
      final BooleanStatus getAllReturnTransactionsStatus}) = _$InitialImpl;

  @override
  List<GetAllReturnTransactionsResponse>? get getAllReturnTransactionsResponse;
  @override
  BooleanStatus get getAllReturnTransactionsStatus;

  /// Create a copy of GetAllReturnTransactionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
