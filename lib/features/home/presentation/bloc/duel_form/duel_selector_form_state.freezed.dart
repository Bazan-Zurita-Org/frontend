// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'duel_selector_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DuelSelectorFormState {
  List<dynamic> get duels => throw _privateConstructorUsedError;
  dynamic? get duelSelected => throw _privateConstructorUsedError;

  /// Create a copy of DuelSelectorFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DuelSelectorFormStateCopyWith<DuelSelectorFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DuelSelectorFormStateCopyWith<$Res> {
  factory $DuelSelectorFormStateCopyWith(DuelSelectorFormState value,
          $Res Function(DuelSelectorFormState) then) =
      _$DuelSelectorFormStateCopyWithImpl<$Res, DuelSelectorFormState>;
  @useResult
  $Res call({List<dynamic> duels, dynamic? duelSelected});
}

/// @nodoc
class _$DuelSelectorFormStateCopyWithImpl<$Res,
        $Val extends DuelSelectorFormState>
    implements $DuelSelectorFormStateCopyWith<$Res> {
  _$DuelSelectorFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DuelSelectorFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duels = null,
    Object? duelSelected = freezed,
  }) {
    return _then(_value.copyWith(
      duels: null == duels
          ? _value.duels
          : duels // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      duelSelected: freezed == duelSelected
          ? _value.duelSelected
          : duelSelected // ignore: cast_nullable_to_non_nullable
              as dynamic?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DuelSelectorFormStateImplCopyWith<$Res>
    implements $DuelSelectorFormStateCopyWith<$Res> {
  factory _$$DuelSelectorFormStateImplCopyWith(
          _$DuelSelectorFormStateImpl value,
          $Res Function(_$DuelSelectorFormStateImpl) then) =
      __$$DuelSelectorFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic> duels, dynamic? duelSelected});
}

/// @nodoc
class __$$DuelSelectorFormStateImplCopyWithImpl<$Res>
    extends _$DuelSelectorFormStateCopyWithImpl<$Res,
        _$DuelSelectorFormStateImpl>
    implements _$$DuelSelectorFormStateImplCopyWith<$Res> {
  __$$DuelSelectorFormStateImplCopyWithImpl(_$DuelSelectorFormStateImpl _value,
      $Res Function(_$DuelSelectorFormStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DuelSelectorFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duels = null,
    Object? duelSelected = freezed,
  }) {
    return _then(_$DuelSelectorFormStateImpl(
      duels: null == duels
          ? _value._duels
          : duels // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      duelSelected: freezed == duelSelected
          ? _value.duelSelected
          : duelSelected // ignore: cast_nullable_to_non_nullable
              as dynamic?,
    ));
  }
}

/// @nodoc

class _$DuelSelectorFormStateImpl extends _DuelSelectorFormState {
  _$DuelSelectorFormStateImpl(
      {final List<dynamic> duels = const [], this.duelSelected})
      : _duels = duels,
        super._();

  final List<dynamic> _duels;
  @override
  @JsonKey()
  List<dynamic> get duels {
    if (_duels is EqualUnmodifiableListView) return _duels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_duels);
  }

  @override
  final dynamic? duelSelected;

  @override
  String toString() {
    return 'DuelSelectorFormState(duels: $duels, duelSelected: $duelSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DuelSelectorFormStateImpl &&
            const DeepCollectionEquality().equals(other._duels, _duels) &&
            const DeepCollectionEquality()
                .equals(other.duelSelected, duelSelected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_duels),
      const DeepCollectionEquality().hash(duelSelected));

  /// Create a copy of DuelSelectorFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DuelSelectorFormStateImplCopyWith<_$DuelSelectorFormStateImpl>
      get copyWith => __$$DuelSelectorFormStateImplCopyWithImpl<
          _$DuelSelectorFormStateImpl>(this, _$identity);
}

abstract class _DuelSelectorFormState extends DuelSelectorFormState {
  factory _DuelSelectorFormState(
      {final List<dynamic> duels,
      final dynamic? duelSelected}) = _$DuelSelectorFormStateImpl;
  _DuelSelectorFormState._() : super._();

  @override
  List<dynamic> get duels;
  @override
  dynamic? get duelSelected;

  /// Create a copy of DuelSelectorFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DuelSelectorFormStateImplCopyWith<_$DuelSelectorFormStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
