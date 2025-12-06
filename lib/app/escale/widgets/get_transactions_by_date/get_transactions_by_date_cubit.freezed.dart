// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_transactions_by_date_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetTransactionsByDateState {
  String get date => throw _privateConstructorUsedError;
  List<GetAllTransactionsResponse>? get getAllTransactionsResponse =>
      throw _privateConstructorUsedError;
  BooleanStatus get getAllTransactionsStatus =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String date,
            List<GetAllTransactionsResponse>? getAllTransactionsResponse,
            BooleanStatus getAllTransactionsStatus)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String date,
            List<GetAllTransactionsResponse>? getAllTransactionsResponse,
            BooleanStatus getAllTransactionsStatus)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String date,
            List<GetAllTransactionsResponse>? getAllTransactionsResponse,
            BooleanStatus getAllTransactionsStatus)?
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

  /// Create a copy of GetTransactionsByDateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetTransactionsByDateStateCopyWith<GetTransactionsByDateState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetTransactionsByDateStateCopyWith<$Res> {
  factory $GetTransactionsByDateStateCopyWith(GetTransactionsByDateState value,
          $Res Function(GetTransactionsByDateState) then) =
      _$GetTransactionsByDateStateCopyWithImpl<$Res,
          GetTransactionsByDateState>;
  @useResult
  $Res call(
      {String date,
      List<GetAllTransactionsResponse>? getAllTransactionsResponse,
      BooleanStatus getAllTransactionsStatus});
}

/// @nodoc
class _$GetTransactionsByDateStateCopyWithImpl<$Res,
        $Val extends GetTransactionsByDateState>
    implements $GetTransactionsByDateStateCopyWith<$Res> {
  _$GetTransactionsByDateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetTransactionsByDateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? getAllTransactionsResponse = freezed,
    Object? getAllTransactionsStatus = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      getAllTransactionsResponse: freezed == getAllTransactionsResponse
          ? _value.getAllTransactionsResponse
          : getAllTransactionsResponse // ignore: cast_nullable_to_non_nullable
              as List<GetAllTransactionsResponse>?,
      getAllTransactionsStatus: null == getAllTransactionsStatus
          ? _value.getAllTransactionsStatus
          : getAllTransactionsStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $GetTransactionsByDateStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      List<GetAllTransactionsResponse>? getAllTransactionsResponse,
      BooleanStatus getAllTransactionsStatus});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$GetTransactionsByDateStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetTransactionsByDateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? getAllTransactionsResponse = freezed,
    Object? getAllTransactionsStatus = null,
  }) {
    return _then(_$InitialImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      getAllTransactionsResponse: freezed == getAllTransactionsResponse
          ? _value._getAllTransactionsResponse
          : getAllTransactionsResponse // ignore: cast_nullable_to_non_nullable
              as List<GetAllTransactionsResponse>?,
      getAllTransactionsStatus: null == getAllTransactionsStatus
          ? _value.getAllTransactionsStatus
          : getAllTransactionsStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.date,
      final List<GetAllTransactionsResponse>? getAllTransactionsResponse,
      this.getAllTransactionsStatus = BooleanStatus.initial})
      : _getAllTransactionsResponse = getAllTransactionsResponse;

  @override
  final String date;
  final List<GetAllTransactionsResponse>? _getAllTransactionsResponse;
  @override
  List<GetAllTransactionsResponse>? get getAllTransactionsResponse {
    final value = _getAllTransactionsResponse;
    if (value == null) return null;
    if (_getAllTransactionsResponse is EqualUnmodifiableListView)
      return _getAllTransactionsResponse;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final BooleanStatus getAllTransactionsStatus;

  @override
  String toString() {
    return 'GetTransactionsByDateState.initial(date: $date, getAllTransactionsResponse: $getAllTransactionsResponse, getAllTransactionsStatus: $getAllTransactionsStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(
                other._getAllTransactionsResponse,
                _getAllTransactionsResponse) &&
            (identical(
                    other.getAllTransactionsStatus, getAllTransactionsStatus) ||
                other.getAllTransactionsStatus == getAllTransactionsStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      const DeepCollectionEquality().hash(_getAllTransactionsResponse),
      getAllTransactionsStatus);

  /// Create a copy of GetTransactionsByDateState
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
            String date,
            List<GetAllTransactionsResponse>? getAllTransactionsResponse,
            BooleanStatus getAllTransactionsStatus)
        initial,
  }) {
    return initial(date, getAllTransactionsResponse, getAllTransactionsStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String date,
            List<GetAllTransactionsResponse>? getAllTransactionsResponse,
            BooleanStatus getAllTransactionsStatus)?
        initial,
  }) {
    return initial?.call(
        date, getAllTransactionsResponse, getAllTransactionsStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String date,
            List<GetAllTransactionsResponse>? getAllTransactionsResponse,
            BooleanStatus getAllTransactionsStatus)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          date, getAllTransactionsResponse, getAllTransactionsStatus);
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

abstract class _Initial implements GetTransactionsByDateState {
  const factory _Initial(
      {required final String date,
      final List<GetAllTransactionsResponse>? getAllTransactionsResponse,
      final BooleanStatus getAllTransactionsStatus}) = _$InitialImpl;

  @override
  String get date;
  @override
  List<GetAllTransactionsResponse>? get getAllTransactionsResponse;
  @override
  BooleanStatus get getAllTransactionsStatus;

  /// Create a copy of GetTransactionsByDateState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
