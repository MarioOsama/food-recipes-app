// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favourite_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FavouriteState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Meals> data) success,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Meals> data)? success,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Meals> data)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(FavouriteLoading value) loading,
    required TResult Function(FavouriteSuccess value) success,
    required TResult Function(FavouriteError value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(FavouriteLoading value)? loading,
    TResult? Function(FavouriteSuccess value)? success,
    TResult? Function(FavouriteError value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(FavouriteLoading value)? loading,
    TResult Function(FavouriteSuccess value)? success,
    TResult Function(FavouriteError value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouriteStateCopyWith<$Res> {
  factory $FavouriteStateCopyWith(
          FavouriteState value, $Res Function(FavouriteState) then) =
      _$FavouriteStateCopyWithImpl<$Res, FavouriteState>;
}

/// @nodoc
class _$FavouriteStateCopyWithImpl<$Res, $Val extends FavouriteState>
    implements $FavouriteStateCopyWith<$Res> {
  _$FavouriteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$FavouriteStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'FavouriteState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Meals> data) success,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Meals> data)? success,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Meals> data)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(FavouriteLoading value) loading,
    required TResult Function(FavouriteSuccess value) success,
    required TResult Function(FavouriteError value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(FavouriteLoading value)? loading,
    TResult? Function(FavouriteSuccess value)? success,
    TResult? Function(FavouriteError value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(FavouriteLoading value)? loading,
    TResult Function(FavouriteSuccess value)? success,
    TResult Function(FavouriteError value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements FavouriteState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$FavouriteLoadingImplCopyWith<$Res> {
  factory _$$FavouriteLoadingImplCopyWith(_$FavouriteLoadingImpl value,
          $Res Function(_$FavouriteLoadingImpl) then) =
      __$$FavouriteLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FavouriteLoadingImplCopyWithImpl<$Res>
    extends _$FavouriteStateCopyWithImpl<$Res, _$FavouriteLoadingImpl>
    implements _$$FavouriteLoadingImplCopyWith<$Res> {
  __$$FavouriteLoadingImplCopyWithImpl(_$FavouriteLoadingImpl _value,
      $Res Function(_$FavouriteLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FavouriteLoadingImpl implements FavouriteLoading {
  const _$FavouriteLoadingImpl();

  @override
  String toString() {
    return 'FavouriteState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FavouriteLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Meals> data) success,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Meals> data)? success,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Meals> data)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(FavouriteLoading value) loading,
    required TResult Function(FavouriteSuccess value) success,
    required TResult Function(FavouriteError value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(FavouriteLoading value)? loading,
    TResult? Function(FavouriteSuccess value)? success,
    TResult? Function(FavouriteError value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(FavouriteLoading value)? loading,
    TResult Function(FavouriteSuccess value)? success,
    TResult Function(FavouriteError value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FavouriteLoading implements FavouriteState {
  const factory FavouriteLoading() = _$FavouriteLoadingImpl;
}

/// @nodoc
abstract class _$$FavouriteSuccessImplCopyWith<$Res> {
  factory _$$FavouriteSuccessImplCopyWith(_$FavouriteSuccessImpl value,
          $Res Function(_$FavouriteSuccessImpl) then) =
      __$$FavouriteSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Meals> data});
}

/// @nodoc
class __$$FavouriteSuccessImplCopyWithImpl<$Res>
    extends _$FavouriteStateCopyWithImpl<$Res, _$FavouriteSuccessImpl>
    implements _$$FavouriteSuccessImplCopyWith<$Res> {
  __$$FavouriteSuccessImplCopyWithImpl(_$FavouriteSuccessImpl _value,
      $Res Function(_$FavouriteSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$FavouriteSuccessImpl(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Meals>,
    ));
  }
}

/// @nodoc

class _$FavouriteSuccessImpl implements FavouriteSuccess {
  const _$FavouriteSuccessImpl(final List<Meals> data) : _data = data;

  final List<Meals> _data;
  @override
  List<Meals> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'FavouriteState.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavouriteSuccessImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavouriteSuccessImplCopyWith<_$FavouriteSuccessImpl> get copyWith =>
      __$$FavouriteSuccessImplCopyWithImpl<_$FavouriteSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Meals> data) success,
    required TResult Function(String message) failure,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Meals> data)? success,
    TResult? Function(String message)? failure,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Meals> data)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(FavouriteLoading value) loading,
    required TResult Function(FavouriteSuccess value) success,
    required TResult Function(FavouriteError value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(FavouriteLoading value)? loading,
    TResult? Function(FavouriteSuccess value)? success,
    TResult? Function(FavouriteError value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(FavouriteLoading value)? loading,
    TResult Function(FavouriteSuccess value)? success,
    TResult Function(FavouriteError value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class FavouriteSuccess implements FavouriteState {
  const factory FavouriteSuccess(final List<Meals> data) =
      _$FavouriteSuccessImpl;

  List<Meals> get data;
  @JsonKey(ignore: true)
  _$$FavouriteSuccessImplCopyWith<_$FavouriteSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FavouriteErrorImplCopyWith<$Res> {
  factory _$$FavouriteErrorImplCopyWith(_$FavouriteErrorImpl value,
          $Res Function(_$FavouriteErrorImpl) then) =
      __$$FavouriteErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FavouriteErrorImplCopyWithImpl<$Res>
    extends _$FavouriteStateCopyWithImpl<$Res, _$FavouriteErrorImpl>
    implements _$$FavouriteErrorImplCopyWith<$Res> {
  __$$FavouriteErrorImplCopyWithImpl(
      _$FavouriteErrorImpl _value, $Res Function(_$FavouriteErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FavouriteErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FavouriteErrorImpl implements FavouriteError {
  const _$FavouriteErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'FavouriteState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavouriteErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavouriteErrorImplCopyWith<_$FavouriteErrorImpl> get copyWith =>
      __$$FavouriteErrorImplCopyWithImpl<_$FavouriteErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Meals> data) success,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Meals> data)? success,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Meals> data)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(FavouriteLoading value) loading,
    required TResult Function(FavouriteSuccess value) success,
    required TResult Function(FavouriteError value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(FavouriteLoading value)? loading,
    TResult? Function(FavouriteSuccess value)? success,
    TResult? Function(FavouriteError value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(FavouriteLoading value)? loading,
    TResult Function(FavouriteSuccess value)? success,
    TResult Function(FavouriteError value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class FavouriteError implements FavouriteState {
  const factory FavouriteError(final String message) = _$FavouriteErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FavouriteErrorImplCopyWith<_$FavouriteErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
