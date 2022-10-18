// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'beer_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BeerDto _$BeerDtoFromJson(Map<String, dynamic> json) {
  return _BeerDto.fromJson(json);
}

/// @nodoc
mixin _$BeerDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get tagline => throw _privateConstructorUsedError;
  DateTime get firstBrewed => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  double get abv => throw _privateConstructorUsedError;
  double get ibu => throw _privateConstructorUsedError;
  int get targetFg => throw _privateConstructorUsedError;
  int get targetOg => throw _privateConstructorUsedError;
  int get ebc => throw _privateConstructorUsedError;
  int get srm => throw _privateConstructorUsedError;
  double get ph => throw _privateConstructorUsedError;
  double get attenuationLevel => throw _privateConstructorUsedError;
  UnitValueDto get volume => throw _privateConstructorUsedError;
  UnitValueDto get boilVolume => throw _privateConstructorUsedError;
  BeerMethodDto get method => throw _privateConstructorUsedError;
  BeerIngredientsDto get ingredients => throw _privateConstructorUsedError;
  List<String> get foodPairing => throw _privateConstructorUsedError;
  String get brewersTips => throw _privateConstructorUsedError;
  String get contributedBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BeerDtoCopyWith<BeerDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeerDtoCopyWith<$Res> {
  factory $BeerDtoCopyWith(BeerDto value, $Res Function(BeerDto) then) =
      _$BeerDtoCopyWithImpl<$Res, BeerDto>;
  @useResult
  $Res call(
      {int id,
      String name,
      String tagline,
      DateTime firstBrewed,
      String description,
      String imageUrl,
      double abv,
      double ibu,
      int targetFg,
      int targetOg,
      int ebc,
      int srm,
      double ph,
      double attenuationLevel,
      UnitValueDto volume,
      UnitValueDto boilVolume,
      BeerMethodDto method,
      BeerIngredientsDto ingredients,
      List<String> foodPairing,
      String brewersTips,
      String contributedBy});

  $UnitValueDtoCopyWith<$Res> get volume;
  $UnitValueDtoCopyWith<$Res> get boilVolume;
  $BeerMethodDtoCopyWith<$Res> get method;
  $BeerIngredientsDtoCopyWith<$Res> get ingredients;
}

/// @nodoc
class _$BeerDtoCopyWithImpl<$Res, $Val extends BeerDto>
    implements $BeerDtoCopyWith<$Res> {
  _$BeerDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? tagline = null,
    Object? firstBrewed = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? abv = null,
    Object? ibu = null,
    Object? targetFg = null,
    Object? targetOg = null,
    Object? ebc = null,
    Object? srm = null,
    Object? ph = null,
    Object? attenuationLevel = null,
    Object? volume = null,
    Object? boilVolume = null,
    Object? method = null,
    Object? ingredients = null,
    Object? foodPairing = null,
    Object? brewersTips = null,
    Object? contributedBy = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tagline: null == tagline
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String,
      firstBrewed: null == firstBrewed
          ? _value.firstBrewed
          : firstBrewed // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      abv: null == abv
          ? _value.abv
          : abv // ignore: cast_nullable_to_non_nullable
              as double,
      ibu: null == ibu
          ? _value.ibu
          : ibu // ignore: cast_nullable_to_non_nullable
              as double,
      targetFg: null == targetFg
          ? _value.targetFg
          : targetFg // ignore: cast_nullable_to_non_nullable
              as int,
      targetOg: null == targetOg
          ? _value.targetOg
          : targetOg // ignore: cast_nullable_to_non_nullable
              as int,
      ebc: null == ebc
          ? _value.ebc
          : ebc // ignore: cast_nullable_to_non_nullable
              as int,
      srm: null == srm
          ? _value.srm
          : srm // ignore: cast_nullable_to_non_nullable
              as int,
      ph: null == ph
          ? _value.ph
          : ph // ignore: cast_nullable_to_non_nullable
              as double,
      attenuationLevel: null == attenuationLevel
          ? _value.attenuationLevel
          : attenuationLevel // ignore: cast_nullable_to_non_nullable
              as double,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as UnitValueDto,
      boilVolume: null == boilVolume
          ? _value.boilVolume
          : boilVolume // ignore: cast_nullable_to_non_nullable
              as UnitValueDto,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as BeerMethodDto,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as BeerIngredientsDto,
      foodPairing: null == foodPairing
          ? _value.foodPairing
          : foodPairing // ignore: cast_nullable_to_non_nullable
              as List<String>,
      brewersTips: null == brewersTips
          ? _value.brewersTips
          : brewersTips // ignore: cast_nullable_to_non_nullable
              as String,
      contributedBy: null == contributedBy
          ? _value.contributedBy
          : contributedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UnitValueDtoCopyWith<$Res> get volume {
    return $UnitValueDtoCopyWith<$Res>(_value.volume, (value) {
      return _then(_value.copyWith(volume: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UnitValueDtoCopyWith<$Res> get boilVolume {
    return $UnitValueDtoCopyWith<$Res>(_value.boilVolume, (value) {
      return _then(_value.copyWith(boilVolume: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BeerMethodDtoCopyWith<$Res> get method {
    return $BeerMethodDtoCopyWith<$Res>(_value.method, (value) {
      return _then(_value.copyWith(method: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BeerIngredientsDtoCopyWith<$Res> get ingredients {
    return $BeerIngredientsDtoCopyWith<$Res>(_value.ingredients, (value) {
      return _then(_value.copyWith(ingredients: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BeerDtoCopyWith<$Res> implements $BeerDtoCopyWith<$Res> {
  factory _$$_BeerDtoCopyWith(
          _$_BeerDto value, $Res Function(_$_BeerDto) then) =
      __$$_BeerDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String tagline,
      DateTime firstBrewed,
      String description,
      String imageUrl,
      double abv,
      double ibu,
      int targetFg,
      int targetOg,
      int ebc,
      int srm,
      double ph,
      double attenuationLevel,
      UnitValueDto volume,
      UnitValueDto boilVolume,
      BeerMethodDto method,
      BeerIngredientsDto ingredients,
      List<String> foodPairing,
      String brewersTips,
      String contributedBy});

  @override
  $UnitValueDtoCopyWith<$Res> get volume;
  @override
  $UnitValueDtoCopyWith<$Res> get boilVolume;
  @override
  $BeerMethodDtoCopyWith<$Res> get method;
  @override
  $BeerIngredientsDtoCopyWith<$Res> get ingredients;
}

/// @nodoc
class __$$_BeerDtoCopyWithImpl<$Res>
    extends _$BeerDtoCopyWithImpl<$Res, _$_BeerDto>
    implements _$$_BeerDtoCopyWith<$Res> {
  __$$_BeerDtoCopyWithImpl(_$_BeerDto _value, $Res Function(_$_BeerDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? tagline = null,
    Object? firstBrewed = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? abv = null,
    Object? ibu = null,
    Object? targetFg = null,
    Object? targetOg = null,
    Object? ebc = null,
    Object? srm = null,
    Object? ph = null,
    Object? attenuationLevel = null,
    Object? volume = null,
    Object? boilVolume = null,
    Object? method = null,
    Object? ingredients = null,
    Object? foodPairing = null,
    Object? brewersTips = null,
    Object? contributedBy = null,
  }) {
    return _then(_$_BeerDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tagline: null == tagline
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String,
      firstBrewed: null == firstBrewed
          ? _value.firstBrewed
          : firstBrewed // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      abv: null == abv
          ? _value.abv
          : abv // ignore: cast_nullable_to_non_nullable
              as double,
      ibu: null == ibu
          ? _value.ibu
          : ibu // ignore: cast_nullable_to_non_nullable
              as double,
      targetFg: null == targetFg
          ? _value.targetFg
          : targetFg // ignore: cast_nullable_to_non_nullable
              as int,
      targetOg: null == targetOg
          ? _value.targetOg
          : targetOg // ignore: cast_nullable_to_non_nullable
              as int,
      ebc: null == ebc
          ? _value.ebc
          : ebc // ignore: cast_nullable_to_non_nullable
              as int,
      srm: null == srm
          ? _value.srm
          : srm // ignore: cast_nullable_to_non_nullable
              as int,
      ph: null == ph
          ? _value.ph
          : ph // ignore: cast_nullable_to_non_nullable
              as double,
      attenuationLevel: null == attenuationLevel
          ? _value.attenuationLevel
          : attenuationLevel // ignore: cast_nullable_to_non_nullable
              as double,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as UnitValueDto,
      boilVolume: null == boilVolume
          ? _value.boilVolume
          : boilVolume // ignore: cast_nullable_to_non_nullable
              as UnitValueDto,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as BeerMethodDto,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as BeerIngredientsDto,
      foodPairing: null == foodPairing
          ? _value._foodPairing
          : foodPairing // ignore: cast_nullable_to_non_nullable
              as List<String>,
      brewersTips: null == brewersTips
          ? _value.brewersTips
          : brewersTips // ignore: cast_nullable_to_non_nullable
              as String,
      contributedBy: null == contributedBy
          ? _value.contributedBy
          : contributedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
@FirstBrewedConverter()
class _$_BeerDto extends _BeerDto {
  const _$_BeerDto(
      {required this.id,
      required this.name,
      required this.tagline,
      required this.firstBrewed,
      required this.description,
      required this.imageUrl,
      required this.abv,
      required this.ibu,
      required this.targetFg,
      required this.targetOg,
      required this.ebc,
      required this.srm,
      required this.ph,
      required this.attenuationLevel,
      required this.volume,
      required this.boilVolume,
      required this.method,
      required this.ingredients,
      required final List<String> foodPairing,
      required this.brewersTips,
      required this.contributedBy})
      : _foodPairing = foodPairing,
        super._();

  factory _$_BeerDto.fromJson(Map<String, dynamic> json) =>
      _$$_BeerDtoFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String tagline;
  @override
  final DateTime firstBrewed;
  @override
  final String description;
  @override
  final String imageUrl;
  @override
  final double abv;
  @override
  final double ibu;
  @override
  final int targetFg;
  @override
  final int targetOg;
  @override
  final int ebc;
  @override
  final int srm;
  @override
  final double ph;
  @override
  final double attenuationLevel;
  @override
  final UnitValueDto volume;
  @override
  final UnitValueDto boilVolume;
  @override
  final BeerMethodDto method;
  @override
  final BeerIngredientsDto ingredients;
  final List<String> _foodPairing;
  @override
  List<String> get foodPairing {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foodPairing);
  }

  @override
  final String brewersTips;
  @override
  final String contributedBy;

  @override
  String toString() {
    return 'BeerDto(id: $id, name: $name, tagline: $tagline, firstBrewed: $firstBrewed, description: $description, imageUrl: $imageUrl, abv: $abv, ibu: $ibu, targetFg: $targetFg, targetOg: $targetOg, ebc: $ebc, srm: $srm, ph: $ph, attenuationLevel: $attenuationLevel, volume: $volume, boilVolume: $boilVolume, method: $method, ingredients: $ingredients, foodPairing: $foodPairing, brewersTips: $brewersTips, contributedBy: $contributedBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeerDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.tagline, tagline) || other.tagline == tagline) &&
            (identical(other.firstBrewed, firstBrewed) ||
                other.firstBrewed == firstBrewed) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.abv, abv) || other.abv == abv) &&
            (identical(other.ibu, ibu) || other.ibu == ibu) &&
            (identical(other.targetFg, targetFg) ||
                other.targetFg == targetFg) &&
            (identical(other.targetOg, targetOg) ||
                other.targetOg == targetOg) &&
            (identical(other.ebc, ebc) || other.ebc == ebc) &&
            (identical(other.srm, srm) || other.srm == srm) &&
            (identical(other.ph, ph) || other.ph == ph) &&
            (identical(other.attenuationLevel, attenuationLevel) ||
                other.attenuationLevel == attenuationLevel) &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.boilVolume, boilVolume) ||
                other.boilVolume == boilVolume) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.ingredients, ingredients) ||
                other.ingredients == ingredients) &&
            const DeepCollectionEquality()
                .equals(other._foodPairing, _foodPairing) &&
            (identical(other.brewersTips, brewersTips) ||
                other.brewersTips == brewersTips) &&
            (identical(other.contributedBy, contributedBy) ||
                other.contributedBy == contributedBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        tagline,
        firstBrewed,
        description,
        imageUrl,
        abv,
        ibu,
        targetFg,
        targetOg,
        ebc,
        srm,
        ph,
        attenuationLevel,
        volume,
        boilVolume,
        method,
        ingredients,
        const DeepCollectionEquality().hash(_foodPairing),
        brewersTips,
        contributedBy
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeerDtoCopyWith<_$_BeerDto> get copyWith =>
      __$$_BeerDtoCopyWithImpl<_$_BeerDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BeerDtoToJson(
      this,
    );
  }
}

abstract class _BeerDto extends BeerDto {
  const factory _BeerDto(
      {required final int id,
      required final String name,
      required final String tagline,
      required final DateTime firstBrewed,
      required final String description,
      required final String imageUrl,
      required final double abv,
      required final double ibu,
      required final int targetFg,
      required final int targetOg,
      required final int ebc,
      required final int srm,
      required final double ph,
      required final double attenuationLevel,
      required final UnitValueDto volume,
      required final UnitValueDto boilVolume,
      required final BeerMethodDto method,
      required final BeerIngredientsDto ingredients,
      required final List<String> foodPairing,
      required final String brewersTips,
      required final String contributedBy}) = _$_BeerDto;
  const _BeerDto._() : super._();

  factory _BeerDto.fromJson(Map<String, dynamic> json) = _$_BeerDto.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get tagline;
  @override
  DateTime get firstBrewed;
  @override
  String get description;
  @override
  String get imageUrl;
  @override
  double get abv;
  @override
  double get ibu;
  @override
  int get targetFg;
  @override
  int get targetOg;
  @override
  int get ebc;
  @override
  int get srm;
  @override
  double get ph;
  @override
  double get attenuationLevel;
  @override
  UnitValueDto get volume;
  @override
  UnitValueDto get boilVolume;
  @override
  BeerMethodDto get method;
  @override
  BeerIngredientsDto get ingredients;
  @override
  List<String> get foodPairing;
  @override
  String get brewersTips;
  @override
  String get contributedBy;
  @override
  @JsonKey(ignore: true)
  _$$_BeerDtoCopyWith<_$_BeerDto> get copyWith =>
      throw _privateConstructorUsedError;
}
