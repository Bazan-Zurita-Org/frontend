// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diet_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DietEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() doGetDiets,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? doGetDiets,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? doGetDiets,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DoGetDiets value) doGetDiets,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DoGetDiets value)? doGetDiets,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DoGetDiets value)? doGetDiets,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DietEventCopyWith<$Res> {
  factory $DietEventCopyWith(DietEvent value, $Res Function(DietEvent) then) =
      _$DietEventCopyWithImpl<$Res, DietEvent>;
}

/// @nodoc
class _$DietEventCopyWithImpl<$Res, $Val extends DietEvent>
    implements $DietEventCopyWith<$Res> {
  _$DietEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DietEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DoGetDietsImplCopyWith<$Res> {
  factory _$$DoGetDietsImplCopyWith(
          _$DoGetDietsImpl value, $Res Function(_$DoGetDietsImpl) then) =
      __$$DoGetDietsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DoGetDietsImplCopyWithImpl<$Res>
    extends _$DietEventCopyWithImpl<$Res, _$DoGetDietsImpl>
    implements _$$DoGetDietsImplCopyWith<$Res> {
  __$$DoGetDietsImplCopyWithImpl(
      _$DoGetDietsImpl _value, $Res Function(_$DoGetDietsImpl) _then)
      : super(_value, _then);

  /// Create a copy of DietEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DoGetDietsImpl implements DoGetDiets {
  const _$DoGetDietsImpl();

  @override
  String toString() {
    return 'DietEvent.doGetDiets()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DoGetDietsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() doGetDiets,
  }) {
    return doGetDiets();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? doGetDiets,
  }) {
    return doGetDiets?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? doGetDiets,
    required TResult orElse(),
  }) {
    if (doGetDiets != null) {
      return doGetDiets();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DoGetDiets value) doGetDiets,
  }) {
    return doGetDiets(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DoGetDiets value)? doGetDiets,
  }) {
    return doGetDiets?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DoGetDiets value)? doGetDiets,
    required TResult orElse(),
  }) {
    if (doGetDiets != null) {
      return doGetDiets(this);
    }
    return orElse();
  }
}

abstract class DoGetDiets implements DietEvent {
  const factory DoGetDiets() = _$DoGetDietsImpl;
}
