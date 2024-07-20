// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'init_exam_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InitExamState {
  bool get deleting => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  bool get hasExam => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool deleting, bool loading, bool hasError,
            bool hasExam, String date)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool deleting, bool loading, bool hasError, bool hasExam,
            String date)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool deleting, bool loading, bool hasError, bool hasExam,
            String date)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InitExamStateCopyWith<InitExamState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitExamStateCopyWith<$Res> {
  factory $InitExamStateCopyWith(
          InitExamState value, $Res Function(InitExamState) then) =
      _$InitExamStateCopyWithImpl<$Res, InitExamState>;
  @useResult
  $Res call(
      {bool deleting, bool loading, bool hasError, bool hasExam, String date});
}

/// @nodoc
class _$InitExamStateCopyWithImpl<$Res, $Val extends InitExamState>
    implements $InitExamStateCopyWith<$Res> {
  _$InitExamStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deleting = null,
    Object? loading = null,
    Object? hasError = null,
    Object? hasExam = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      deleting: null == deleting
          ? _value.deleting
          : deleting // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      hasExam: null == hasExam
          ? _value.hasExam
          : hasExam // ignore: cast_nullable_to_non_nullable
              as bool,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$initialImplCopyWith<$Res>
    implements $InitExamStateCopyWith<$Res> {
  factory _$$initialImplCopyWith(
          _$initialImpl value, $Res Function(_$initialImpl) then) =
      __$$initialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool deleting, bool loading, bool hasError, bool hasExam, String date});
}

/// @nodoc
class __$$initialImplCopyWithImpl<$Res>
    extends _$InitExamStateCopyWithImpl<$Res, _$initialImpl>
    implements _$$initialImplCopyWith<$Res> {
  __$$initialImplCopyWithImpl(
      _$initialImpl _value, $Res Function(_$initialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deleting = null,
    Object? loading = null,
    Object? hasError = null,
    Object? hasExam = null,
    Object? date = null,
  }) {
    return _then(_$initialImpl(
      deleting: null == deleting
          ? _value.deleting
          : deleting // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      hasExam: null == hasExam
          ? _value.hasExam
          : hasExam // ignore: cast_nullable_to_non_nullable
              as bool,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$initialImpl implements _initial {
  _$initialImpl(
      {this.deleting = false,
      this.loading = false,
      this.hasError = false,
      this.hasExam = false,
      this.date = ''});

  @override
  @JsonKey()
  final bool deleting;
  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool hasError;
  @override
  @JsonKey()
  final bool hasExam;
  @override
  @JsonKey()
  final String date;

  @override
  String toString() {
    return 'InitExamState.initial(deleting: $deleting, loading: $loading, hasError: $hasError, hasExam: $hasExam, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$initialImpl &&
            (identical(other.deleting, deleting) ||
                other.deleting == deleting) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.hasExam, hasExam) || other.hasExam == hasExam) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, deleting, loading, hasError, hasExam, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$initialImplCopyWith<_$initialImpl> get copyWith =>
      __$$initialImplCopyWithImpl<_$initialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool deleting, bool loading, bool hasError,
            bool hasExam, String date)
        initial,
  }) {
    return initial(deleting, loading, hasError, hasExam, date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool deleting, bool loading, bool hasError, bool hasExam,
            String date)?
        initial,
  }) {
    return initial?.call(deleting, loading, hasError, hasExam, date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool deleting, bool loading, bool hasError, bool hasExam,
            String date)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(deleting, loading, hasError, hasExam, date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _initial implements InitExamState {
  factory _initial(
      {final bool deleting,
      final bool loading,
      final bool hasError,
      final bool hasExam,
      final String date}) = _$initialImpl;

  @override
  bool get deleting;
  @override
  bool get loading;
  @override
  bool get hasError;
  @override
  bool get hasExam;
  @override
  String get date;
  @override
  @JsonKey(ignore: true)
  _$$initialImplCopyWith<_$initialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
