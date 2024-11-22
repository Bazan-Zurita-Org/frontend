// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diet_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Calories _$CaloriesFromJson(Map<String, dynamic> json) {
  return _Calories.fromJson(json);
}

/// @nodoc
mixin _$Calories {
  int get min => throw _privateConstructorUsedError;
  int get max => throw _privateConstructorUsedError;

  /// Serializes this Calories to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Calories
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CaloriesCopyWith<Calories> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CaloriesCopyWith<$Res> {
  factory $CaloriesCopyWith(Calories value, $Res Function(Calories) then) =
      _$CaloriesCopyWithImpl<$Res, Calories>;
  @useResult
  $Res call({int min, int max});
}

/// @nodoc
class _$CaloriesCopyWithImpl<$Res, $Val extends Calories>
    implements $CaloriesCopyWith<$Res> {
  _$CaloriesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Calories
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? max = null,
  }) {
    return _then(_value.copyWith(
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CaloriesImplCopyWith<$Res>
    implements $CaloriesCopyWith<$Res> {
  factory _$$CaloriesImplCopyWith(
          _$CaloriesImpl value, $Res Function(_$CaloriesImpl) then) =
      __$$CaloriesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int min, int max});
}

/// @nodoc
class __$$CaloriesImplCopyWithImpl<$Res>
    extends _$CaloriesCopyWithImpl<$Res, _$CaloriesImpl>
    implements _$$CaloriesImplCopyWith<$Res> {
  __$$CaloriesImplCopyWithImpl(
      _$CaloriesImpl _value, $Res Function(_$CaloriesImpl) _then)
      : super(_value, _then);

  /// Create a copy of Calories
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? max = null,
  }) {
    return _then(_$CaloriesImpl(
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CaloriesImpl implements _Calories {
  const _$CaloriesImpl({this.min = 0, this.max = 0});

  factory _$CaloriesImpl.fromJson(Map<String, dynamic> json) =>
      _$$CaloriesImplFromJson(json);

  @override
  @JsonKey()
  final int min;
  @override
  @JsonKey()
  final int max;

  @override
  String toString() {
    return 'Calories(min: $min, max: $max)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CaloriesImpl &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, min, max);

  /// Create a copy of Calories
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CaloriesImplCopyWith<_$CaloriesImpl> get copyWith =>
      __$$CaloriesImplCopyWithImpl<_$CaloriesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CaloriesImplToJson(
      this,
    );
  }
}

abstract class _Calories implements Calories {
  const factory _Calories({final int min, final int max}) = _$CaloriesImpl;

  factory _Calories.fromJson(Map<String, dynamic> json) =
      _$CaloriesImpl.fromJson;

  @override
  int get min;
  @override
  int get max;

  /// Create a copy of Calories
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CaloriesImplCopyWith<_$CaloriesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Protein _$ProteinFromJson(Map<String, dynamic> json) {
  return _Protein.fromJson(json);
}

/// @nodoc
mixin _$Protein {
  int get min => throw _privateConstructorUsedError;
  int get max => throw _privateConstructorUsedError;

  /// Serializes this Protein to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Protein
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProteinCopyWith<Protein> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProteinCopyWith<$Res> {
  factory $ProteinCopyWith(Protein value, $Res Function(Protein) then) =
      _$ProteinCopyWithImpl<$Res, Protein>;
  @useResult
  $Res call({int min, int max});
}

/// @nodoc
class _$ProteinCopyWithImpl<$Res, $Val extends Protein>
    implements $ProteinCopyWith<$Res> {
  _$ProteinCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Protein
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? max = null,
  }) {
    return _then(_value.copyWith(
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProteinImplCopyWith<$Res> implements $ProteinCopyWith<$Res> {
  factory _$$ProteinImplCopyWith(
          _$ProteinImpl value, $Res Function(_$ProteinImpl) then) =
      __$$ProteinImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int min, int max});
}

/// @nodoc
class __$$ProteinImplCopyWithImpl<$Res>
    extends _$ProteinCopyWithImpl<$Res, _$ProteinImpl>
    implements _$$ProteinImplCopyWith<$Res> {
  __$$ProteinImplCopyWithImpl(
      _$ProteinImpl _value, $Res Function(_$ProteinImpl) _then)
      : super(_value, _then);

  /// Create a copy of Protein
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? max = null,
  }) {
    return _then(_$ProteinImpl(
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProteinImpl implements _Protein {
  const _$ProteinImpl({this.min = 0, this.max = 0});

  factory _$ProteinImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProteinImplFromJson(json);

  @override
  @JsonKey()
  final int min;
  @override
  @JsonKey()
  final int max;

  @override
  String toString() {
    return 'Protein(min: $min, max: $max)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProteinImpl &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, min, max);

  /// Create a copy of Protein
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProteinImplCopyWith<_$ProteinImpl> get copyWith =>
      __$$ProteinImplCopyWithImpl<_$ProteinImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProteinImplToJson(
      this,
    );
  }
}

abstract class _Protein implements Protein {
  const factory _Protein({final int min, final int max}) = _$ProteinImpl;

  factory _Protein.fromJson(Map<String, dynamic> json) = _$ProteinImpl.fromJson;

  @override
  int get min;
  @override
  int get max;

  /// Create a copy of Protein
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProteinImplCopyWith<_$ProteinImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Carbohydrate _$CarbohydrateFromJson(Map<String, dynamic> json) {
  return _Carbohydrate.fromJson(json);
}

/// @nodoc
mixin _$Carbohydrate {
  int get min => throw _privateConstructorUsedError;
  int get max => throw _privateConstructorUsedError;

  /// Serializes this Carbohydrate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Carbohydrate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarbohydrateCopyWith<Carbohydrate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarbohydrateCopyWith<$Res> {
  factory $CarbohydrateCopyWith(
          Carbohydrate value, $Res Function(Carbohydrate) then) =
      _$CarbohydrateCopyWithImpl<$Res, Carbohydrate>;
  @useResult
  $Res call({int min, int max});
}

/// @nodoc
class _$CarbohydrateCopyWithImpl<$Res, $Val extends Carbohydrate>
    implements $CarbohydrateCopyWith<$Res> {
  _$CarbohydrateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Carbohydrate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? max = null,
  }) {
    return _then(_value.copyWith(
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarbohydrateImplCopyWith<$Res>
    implements $CarbohydrateCopyWith<$Res> {
  factory _$$CarbohydrateImplCopyWith(
          _$CarbohydrateImpl value, $Res Function(_$CarbohydrateImpl) then) =
      __$$CarbohydrateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int min, int max});
}

/// @nodoc
class __$$CarbohydrateImplCopyWithImpl<$Res>
    extends _$CarbohydrateCopyWithImpl<$Res, _$CarbohydrateImpl>
    implements _$$CarbohydrateImplCopyWith<$Res> {
  __$$CarbohydrateImplCopyWithImpl(
      _$CarbohydrateImpl _value, $Res Function(_$CarbohydrateImpl) _then)
      : super(_value, _then);

  /// Create a copy of Carbohydrate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? max = null,
  }) {
    return _then(_$CarbohydrateImpl(
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarbohydrateImpl implements _Carbohydrate {
  const _$CarbohydrateImpl({this.min = 0, this.max = 0});

  factory _$CarbohydrateImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarbohydrateImplFromJson(json);

  @override
  @JsonKey()
  final int min;
  @override
  @JsonKey()
  final int max;

  @override
  String toString() {
    return 'Carbohydrate(min: $min, max: $max)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarbohydrateImpl &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, min, max);

  /// Create a copy of Carbohydrate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarbohydrateImplCopyWith<_$CarbohydrateImpl> get copyWith =>
      __$$CarbohydrateImplCopyWithImpl<_$CarbohydrateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarbohydrateImplToJson(
      this,
    );
  }
}

abstract class _Carbohydrate implements Carbohydrate {
  const factory _Carbohydrate({final int min, final int max}) =
      _$CarbohydrateImpl;

  factory _Carbohydrate.fromJson(Map<String, dynamic> json) =
      _$CarbohydrateImpl.fromJson;

  @override
  int get min;
  @override
  int get max;

  /// Create a copy of Carbohydrate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarbohydrateImplCopyWith<_$CarbohydrateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Fat _$FatFromJson(Map<String, dynamic> json) {
  return _Fat.fromJson(json);
}

/// @nodoc
mixin _$Fat {
  int get min => throw _privateConstructorUsedError;
  int get max => throw _privateConstructorUsedError;

  /// Serializes this Fat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Fat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FatCopyWith<Fat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FatCopyWith<$Res> {
  factory $FatCopyWith(Fat value, $Res Function(Fat) then) =
      _$FatCopyWithImpl<$Res, Fat>;
  @useResult
  $Res call({int min, int max});
}

/// @nodoc
class _$FatCopyWithImpl<$Res, $Val extends Fat> implements $FatCopyWith<$Res> {
  _$FatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Fat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? max = null,
  }) {
    return _then(_value.copyWith(
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FatImplCopyWith<$Res> implements $FatCopyWith<$Res> {
  factory _$$FatImplCopyWith(_$FatImpl value, $Res Function(_$FatImpl) then) =
      __$$FatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int min, int max});
}

/// @nodoc
class __$$FatImplCopyWithImpl<$Res> extends _$FatCopyWithImpl<$Res, _$FatImpl>
    implements _$$FatImplCopyWith<$Res> {
  __$$FatImplCopyWithImpl(_$FatImpl _value, $Res Function(_$FatImpl) _then)
      : super(_value, _then);

  /// Create a copy of Fat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? max = null,
  }) {
    return _then(_$FatImpl(
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FatImpl implements _Fat {
  const _$FatImpl({this.min = 0, this.max = 0});

  factory _$FatImpl.fromJson(Map<String, dynamic> json) =>
      _$$FatImplFromJson(json);

  @override
  @JsonKey()
  final int min;
  @override
  @JsonKey()
  final int max;

  @override
  String toString() {
    return 'Fat(min: $min, max: $max)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FatImpl &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, min, max);

  /// Create a copy of Fat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FatImplCopyWith<_$FatImpl> get copyWith =>
      __$$FatImplCopyWithImpl<_$FatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FatImplToJson(
      this,
    );
  }
}

abstract class _Fat implements Fat {
  const factory _Fat({final int min, final int max}) = _$FatImpl;

  factory _Fat.fromJson(Map<String, dynamic> json) = _$FatImpl.fromJson;

  @override
  int get min;
  @override
  int get max;

  /// Create a copy of Fat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FatImplCopyWith<_$FatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Macronutrients _$MacronutrientsFromJson(Map<String, dynamic> json) {
  return _Macronutrients.fromJson(json);
}

/// @nodoc
mixin _$Macronutrients {
  int get protein => throw _privateConstructorUsedError;
  int get carbohydrates => throw _privateConstructorUsedError;
  int get fat => throw _privateConstructorUsedError;

  /// Serializes this Macronutrients to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Macronutrients
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MacronutrientsCopyWith<Macronutrients> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MacronutrientsCopyWith<$Res> {
  factory $MacronutrientsCopyWith(
          Macronutrients value, $Res Function(Macronutrients) then) =
      _$MacronutrientsCopyWithImpl<$Res, Macronutrients>;
  @useResult
  $Res call({int protein, int carbohydrates, int fat});
}

/// @nodoc
class _$MacronutrientsCopyWithImpl<$Res, $Val extends Macronutrients>
    implements $MacronutrientsCopyWith<$Res> {
  _$MacronutrientsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Macronutrients
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? protein = null,
    Object? carbohydrates = null,
    Object? fat = null,
  }) {
    return _then(_value.copyWith(
      protein: null == protein
          ? _value.protein
          : protein // ignore: cast_nullable_to_non_nullable
              as int,
      carbohydrates: null == carbohydrates
          ? _value.carbohydrates
          : carbohydrates // ignore: cast_nullable_to_non_nullable
              as int,
      fat: null == fat
          ? _value.fat
          : fat // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MacronutrientsImplCopyWith<$Res>
    implements $MacronutrientsCopyWith<$Res> {
  factory _$$MacronutrientsImplCopyWith(_$MacronutrientsImpl value,
          $Res Function(_$MacronutrientsImpl) then) =
      __$$MacronutrientsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int protein, int carbohydrates, int fat});
}

/// @nodoc
class __$$MacronutrientsImplCopyWithImpl<$Res>
    extends _$MacronutrientsCopyWithImpl<$Res, _$MacronutrientsImpl>
    implements _$$MacronutrientsImplCopyWith<$Res> {
  __$$MacronutrientsImplCopyWithImpl(
      _$MacronutrientsImpl _value, $Res Function(_$MacronutrientsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Macronutrients
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? protein = null,
    Object? carbohydrates = null,
    Object? fat = null,
  }) {
    return _then(_$MacronutrientsImpl(
      protein: null == protein
          ? _value.protein
          : protein // ignore: cast_nullable_to_non_nullable
              as int,
      carbohydrates: null == carbohydrates
          ? _value.carbohydrates
          : carbohydrates // ignore: cast_nullable_to_non_nullable
              as int,
      fat: null == fat
          ? _value.fat
          : fat // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MacronutrientsImpl implements _Macronutrients {
  const _$MacronutrientsImpl(
      {this.protein = 0, this.carbohydrates = 0, this.fat = 0});

  factory _$MacronutrientsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MacronutrientsImplFromJson(json);

  @override
  @JsonKey()
  final int protein;
  @override
  @JsonKey()
  final int carbohydrates;
  @override
  @JsonKey()
  final int fat;

  @override
  String toString() {
    return 'Macronutrients(protein: $protein, carbohydrates: $carbohydrates, fat: $fat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MacronutrientsImpl &&
            (identical(other.protein, protein) || other.protein == protein) &&
            (identical(other.carbohydrates, carbohydrates) ||
                other.carbohydrates == carbohydrates) &&
            (identical(other.fat, fat) || other.fat == fat));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, protein, carbohydrates, fat);

  /// Create a copy of Macronutrients
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MacronutrientsImplCopyWith<_$MacronutrientsImpl> get copyWith =>
      __$$MacronutrientsImplCopyWithImpl<_$MacronutrientsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MacronutrientsImplToJson(
      this,
    );
  }
}

abstract class _Macronutrients implements Macronutrients {
  const factory _Macronutrients(
      {final int protein,
      final int carbohydrates,
      final int fat}) = _$MacronutrientsImpl;

  factory _Macronutrients.fromJson(Map<String, dynamic> json) =
      _$MacronutrientsImpl.fromJson;

  @override
  int get protein;
  @override
  int get carbohydrates;
  @override
  int get fat;

  /// Create a copy of Macronutrients
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MacronutrientsImplCopyWith<_$MacronutrientsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Food _$FoodFromJson(Map<String, dynamic> json) {
  return _Food.fromJson(json);
}

/// @nodoc
mixin _$Food {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get quantity => throw _privateConstructorUsedError;
  Macronutrients get macronutrients => throw _privateConstructorUsedError;

  /// Serializes this Food to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Food
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FoodCopyWith<Food> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodCopyWith<$Res> {
  factory $FoodCopyWith(Food value, $Res Function(Food) then) =
      _$FoodCopyWithImpl<$Res, Food>;
  @useResult
  $Res call(
      {String id, String name, String quantity, Macronutrients macronutrients});

  $MacronutrientsCopyWith<$Res> get macronutrients;
}

/// @nodoc
class _$FoodCopyWithImpl<$Res, $Val extends Food>
    implements $FoodCopyWith<$Res> {
  _$FoodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Food
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? quantity = null,
    Object? macronutrients = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      macronutrients: null == macronutrients
          ? _value.macronutrients
          : macronutrients // ignore: cast_nullable_to_non_nullable
              as Macronutrients,
    ) as $Val);
  }

  /// Create a copy of Food
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MacronutrientsCopyWith<$Res> get macronutrients {
    return $MacronutrientsCopyWith<$Res>(_value.macronutrients, (value) {
      return _then(_value.copyWith(macronutrients: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FoodImplCopyWith<$Res> implements $FoodCopyWith<$Res> {
  factory _$$FoodImplCopyWith(
          _$FoodImpl value, $Res Function(_$FoodImpl) then) =
      __$$FoodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String name, String quantity, Macronutrients macronutrients});

  @override
  $MacronutrientsCopyWith<$Res> get macronutrients;
}

/// @nodoc
class __$$FoodImplCopyWithImpl<$Res>
    extends _$FoodCopyWithImpl<$Res, _$FoodImpl>
    implements _$$FoodImplCopyWith<$Res> {
  __$$FoodImplCopyWithImpl(_$FoodImpl _value, $Res Function(_$FoodImpl) _then)
      : super(_value, _then);

  /// Create a copy of Food
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? quantity = null,
    Object? macronutrients = null,
  }) {
    return _then(_$FoodImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      macronutrients: null == macronutrients
          ? _value.macronutrients
          : macronutrients // ignore: cast_nullable_to_non_nullable
              as Macronutrients,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FoodImpl implements _Food {
  const _$FoodImpl(
      {required this.id,
      required this.name,
      required this.quantity,
      required this.macronutrients});

  factory _$FoodImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoodImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String quantity;
  @override
  final Macronutrients macronutrients;

  @override
  String toString() {
    return 'Food(id: $id, name: $name, quantity: $quantity, macronutrients: $macronutrients)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.macronutrients, macronutrients) ||
                other.macronutrients == macronutrients));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, quantity, macronutrients);

  /// Create a copy of Food
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodImplCopyWith<_$FoodImpl> get copyWith =>
      __$$FoodImplCopyWithImpl<_$FoodImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodImplToJson(
      this,
    );
  }
}

abstract class _Food implements Food {
  const factory _Food(
      {required final String id,
      required final String name,
      required final String quantity,
      required final Macronutrients macronutrients}) = _$FoodImpl;

  factory _Food.fromJson(Map<String, dynamic> json) = _$FoodImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get quantity;
  @override
  Macronutrients get macronutrients;

  /// Create a copy of Food
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FoodImplCopyWith<_$FoodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MealResponse _$MealResponseFromJson(Map<String, dynamic> json) {
  return _MealResponse.fromJson(json);
}

/// @nodoc
mixin _$MealResponse {
  String get id => throw _privateConstructorUsedError;
  int get type => throw _privateConstructorUsedError;
  String get scheduleTime => throw _privateConstructorUsedError;
  List<Food> get food => throw _privateConstructorUsedError;

  /// Serializes this MealResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MealResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MealResponseCopyWith<MealResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealResponseCopyWith<$Res> {
  factory $MealResponseCopyWith(
          MealResponse value, $Res Function(MealResponse) then) =
      _$MealResponseCopyWithImpl<$Res, MealResponse>;
  @useResult
  $Res call({String id, int type, String scheduleTime, List<Food> food});
}

/// @nodoc
class _$MealResponseCopyWithImpl<$Res, $Val extends MealResponse>
    implements $MealResponseCopyWith<$Res> {
  _$MealResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? scheduleTime = null,
    Object? food = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      scheduleTime: null == scheduleTime
          ? _value.scheduleTime
          : scheduleTime // ignore: cast_nullable_to_non_nullable
              as String,
      food: null == food
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as List<Food>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MealResponseImplCopyWith<$Res>
    implements $MealResponseCopyWith<$Res> {
  factory _$$MealResponseImplCopyWith(
          _$MealResponseImpl value, $Res Function(_$MealResponseImpl) then) =
      __$$MealResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, int type, String scheduleTime, List<Food> food});
}

/// @nodoc
class __$$MealResponseImplCopyWithImpl<$Res>
    extends _$MealResponseCopyWithImpl<$Res, _$MealResponseImpl>
    implements _$$MealResponseImplCopyWith<$Res> {
  __$$MealResponseImplCopyWithImpl(
      _$MealResponseImpl _value, $Res Function(_$MealResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of MealResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? scheduleTime = null,
    Object? food = null,
  }) {
    return _then(_$MealResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      scheduleTime: null == scheduleTime
          ? _value.scheduleTime
          : scheduleTime // ignore: cast_nullable_to_non_nullable
              as String,
      food: null == food
          ? _value._food
          : food // ignore: cast_nullable_to_non_nullable
              as List<Food>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MealResponseImpl implements _MealResponse {
  const _$MealResponseImpl(
      {required this.id,
      required this.type,
      required this.scheduleTime,
      required final List<Food> food})
      : _food = food;

  factory _$MealResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MealResponseImplFromJson(json);

  @override
  final String id;
  @override
  final int type;
  @override
  final String scheduleTime;
  final List<Food> _food;
  @override
  List<Food> get food {
    if (_food is EqualUnmodifiableListView) return _food;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_food);
  }

  @override
  String toString() {
    return 'MealResponse(id: $id, type: $type, scheduleTime: $scheduleTime, food: $food)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.scheduleTime, scheduleTime) ||
                other.scheduleTime == scheduleTime) &&
            const DeepCollectionEquality().equals(other._food, _food));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, scheduleTime,
      const DeepCollectionEquality().hash(_food));

  /// Create a copy of MealResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealResponseImplCopyWith<_$MealResponseImpl> get copyWith =>
      __$$MealResponseImplCopyWithImpl<_$MealResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MealResponseImplToJson(
      this,
    );
  }
}

abstract class _MealResponse implements MealResponse {
  const factory _MealResponse(
      {required final String id,
      required final int type,
      required final String scheduleTime,
      required final List<Food> food}) = _$MealResponseImpl;

  factory _MealResponse.fromJson(Map<String, dynamic> json) =
      _$MealResponseImpl.fromJson;

  @override
  String get id;
  @override
  int get type;
  @override
  String get scheduleTime;
  @override
  List<Food> get food;

  /// Create a copy of MealResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealResponseImplCopyWith<_$MealResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DietResponse _$DietResponseFromJson(Map<String, dynamic> json) {
  return _DietResponse.fromJson(json);
}

/// @nodoc
mixin _$DietResponse {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get goal => throw _privateConstructorUsedError;
  Calories get calories => throw _privateConstructorUsedError;
  Protein get proteins => throw _privateConstructorUsedError;
  Carbohydrate get carbohydrates => throw _privateConstructorUsedError;
  Fat get fats => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  List<MealResponse> get meals => throw _privateConstructorUsedError;

  /// Serializes this DietResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DietResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DietResponseCopyWith<DietResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DietResponseCopyWith<$Res> {
  factory $DietResponseCopyWith(
          DietResponse value, $Res Function(DietResponse) then) =
      _$DietResponseCopyWithImpl<$Res, DietResponse>;
  @useResult
  $Res call(
      {String id,
      String name,
      String goal,
      Calories calories,
      Protein proteins,
      Carbohydrate carbohydrates,
      Fat fats,
      int duration,
      List<MealResponse> meals});

  $CaloriesCopyWith<$Res> get calories;
  $ProteinCopyWith<$Res> get proteins;
  $CarbohydrateCopyWith<$Res> get carbohydrates;
  $FatCopyWith<$Res> get fats;
}

/// @nodoc
class _$DietResponseCopyWithImpl<$Res, $Val extends DietResponse>
    implements $DietResponseCopyWith<$Res> {
  _$DietResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DietResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? goal = null,
    Object? calories = null,
    Object? proteins = null,
    Object? carbohydrates = null,
    Object? fats = null,
    Object? duration = null,
    Object? meals = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as String,
      calories: null == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as Calories,
      proteins: null == proteins
          ? _value.proteins
          : proteins // ignore: cast_nullable_to_non_nullable
              as Protein,
      carbohydrates: null == carbohydrates
          ? _value.carbohydrates
          : carbohydrates // ignore: cast_nullable_to_non_nullable
              as Carbohydrate,
      fats: null == fats
          ? _value.fats
          : fats // ignore: cast_nullable_to_non_nullable
              as Fat,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      meals: null == meals
          ? _value.meals
          : meals // ignore: cast_nullable_to_non_nullable
              as List<MealResponse>,
    ) as $Val);
  }

  /// Create a copy of DietResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CaloriesCopyWith<$Res> get calories {
    return $CaloriesCopyWith<$Res>(_value.calories, (value) {
      return _then(_value.copyWith(calories: value) as $Val);
    });
  }

  /// Create a copy of DietResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProteinCopyWith<$Res> get proteins {
    return $ProteinCopyWith<$Res>(_value.proteins, (value) {
      return _then(_value.copyWith(proteins: value) as $Val);
    });
  }

  /// Create a copy of DietResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CarbohydrateCopyWith<$Res> get carbohydrates {
    return $CarbohydrateCopyWith<$Res>(_value.carbohydrates, (value) {
      return _then(_value.copyWith(carbohydrates: value) as $Val);
    });
  }

  /// Create a copy of DietResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FatCopyWith<$Res> get fats {
    return $FatCopyWith<$Res>(_value.fats, (value) {
      return _then(_value.copyWith(fats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DietResponseImplCopyWith<$Res>
    implements $DietResponseCopyWith<$Res> {
  factory _$$DietResponseImplCopyWith(
          _$DietResponseImpl value, $Res Function(_$DietResponseImpl) then) =
      __$$DietResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String goal,
      Calories calories,
      Protein proteins,
      Carbohydrate carbohydrates,
      Fat fats,
      int duration,
      List<MealResponse> meals});

  @override
  $CaloriesCopyWith<$Res> get calories;
  @override
  $ProteinCopyWith<$Res> get proteins;
  @override
  $CarbohydrateCopyWith<$Res> get carbohydrates;
  @override
  $FatCopyWith<$Res> get fats;
}

/// @nodoc
class __$$DietResponseImplCopyWithImpl<$Res>
    extends _$DietResponseCopyWithImpl<$Res, _$DietResponseImpl>
    implements _$$DietResponseImplCopyWith<$Res> {
  __$$DietResponseImplCopyWithImpl(
      _$DietResponseImpl _value, $Res Function(_$DietResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of DietResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? goal = null,
    Object? calories = null,
    Object? proteins = null,
    Object? carbohydrates = null,
    Object? fats = null,
    Object? duration = null,
    Object? meals = null,
  }) {
    return _then(_$DietResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as String,
      calories: null == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as Calories,
      proteins: null == proteins
          ? _value.proteins
          : proteins // ignore: cast_nullable_to_non_nullable
              as Protein,
      carbohydrates: null == carbohydrates
          ? _value.carbohydrates
          : carbohydrates // ignore: cast_nullable_to_non_nullable
              as Carbohydrate,
      fats: null == fats
          ? _value.fats
          : fats // ignore: cast_nullable_to_non_nullable
              as Fat,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      meals: null == meals
          ? _value._meals
          : meals // ignore: cast_nullable_to_non_nullable
              as List<MealResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DietResponseImpl implements _DietResponse {
  const _$DietResponseImpl(
      {this.id = 'Unknown ID',
      this.name = 'Unknown Name',
      this.goal = 'Unknown Goal',
      this.calories = const Calories(min: 0, max: 0),
      this.proteins = const Protein(min: 0, max: 0),
      this.carbohydrates = const Carbohydrate(min: 0, max: 0),
      this.fats = const Fat(min: 0, max: 0),
      this.duration = 0,
      final List<MealResponse> meals = const []})
      : _meals = meals;

  factory _$DietResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DietResponseImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String goal;
  @override
  @JsonKey()
  final Calories calories;
  @override
  @JsonKey()
  final Protein proteins;
  @override
  @JsonKey()
  final Carbohydrate carbohydrates;
  @override
  @JsonKey()
  final Fat fats;
  @override
  @JsonKey()
  final int duration;
  final List<MealResponse> _meals;
  @override
  @JsonKey()
  List<MealResponse> get meals {
    if (_meals is EqualUnmodifiableListView) return _meals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meals);
  }

  @override
  String toString() {
    return 'DietResponse(id: $id, name: $name, goal: $goal, calories: $calories, proteins: $proteins, carbohydrates: $carbohydrates, fats: $fats, duration: $duration, meals: $meals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DietResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.goal, goal) || other.goal == goal) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.proteins, proteins) ||
                other.proteins == proteins) &&
            (identical(other.carbohydrates, carbohydrates) ||
                other.carbohydrates == carbohydrates) &&
            (identical(other.fats, fats) || other.fats == fats) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            const DeepCollectionEquality().equals(other._meals, _meals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      goal,
      calories,
      proteins,
      carbohydrates,
      fats,
      duration,
      const DeepCollectionEquality().hash(_meals));

  /// Create a copy of DietResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DietResponseImplCopyWith<_$DietResponseImpl> get copyWith =>
      __$$DietResponseImplCopyWithImpl<_$DietResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DietResponseImplToJson(
      this,
    );
  }
}

abstract class _DietResponse implements DietResponse {
  const factory _DietResponse(
      {final String id,
      final String name,
      final String goal,
      final Calories calories,
      final Protein proteins,
      final Carbohydrate carbohydrates,
      final Fat fats,
      final int duration,
      final List<MealResponse> meals}) = _$DietResponseImpl;

  factory _DietResponse.fromJson(Map<String, dynamic> json) =
      _$DietResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get goal;
  @override
  Calories get calories;
  @override
  Protein get proteins;
  @override
  Carbohydrate get carbohydrates;
  @override
  Fat get fats;
  @override
  int get duration;
  @override
  List<MealResponse> get meals;

  /// Create a copy of DietResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DietResponseImplCopyWith<_$DietResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
