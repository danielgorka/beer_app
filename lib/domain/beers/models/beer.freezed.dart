// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'beer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Beer {
  BeerId get id => throw _privateConstructorUsedError;
  BeerName get name => throw _privateConstructorUsedError;
  BeerTagline get tagline => throw _privateConstructorUsedError;
  BeerFirstBrewed get firstBrewed => throw _privateConstructorUsedError;
  BeerDescription get description => throw _privateConstructorUsedError;
  BeerImageUrl? get imageUrl => throw _privateConstructorUsedError;
  BeerAbv get abv => throw _privateConstructorUsedError;
  BeerIbu? get ibu => throw _privateConstructorUsedError;
  BeerTargetFg? get targetFg => throw _privateConstructorUsedError;
  BeerTargetOg? get targetOg => throw _privateConstructorUsedError;
  BeerEbc? get ebc => throw _privateConstructorUsedError;
  BeerSrm? get srm => throw _privateConstructorUsedError;
  BeerPh? get ph => throw _privateConstructorUsedError;
  BeerAttenuationLevel? get attenuationLevel =>
      throw _privateConstructorUsedError;
  BeerVolume get volume => throw _privateConstructorUsedError;
  BeerBoilVolume get boilVolume => throw _privateConstructorUsedError;
  BeerMethod get method => throw _privateConstructorUsedError;
  BeerIngredients get ingredients => throw _privateConstructorUsedError;
  List<BeerFood> get foodPairing => throw _privateConstructorUsedError;
  BeerBrewersTips get brewersTips => throw _privateConstructorUsedError;
  BeerContributedBy get contributedBy => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BeerCopyWith<Beer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeerCopyWith<$Res> {
  factory $BeerCopyWith(Beer value, $Res Function(Beer) then) =
      _$BeerCopyWithImpl<$Res, Beer>;
  @useResult
  $Res call(
      {BeerId id,
      BeerName name,
      BeerTagline tagline,
      BeerFirstBrewed firstBrewed,
      BeerDescription description,
      BeerImageUrl? imageUrl,
      BeerAbv abv,
      BeerIbu? ibu,
      BeerTargetFg? targetFg,
      BeerTargetOg? targetOg,
      BeerEbc? ebc,
      BeerSrm? srm,
      BeerPh? ph,
      BeerAttenuationLevel? attenuationLevel,
      BeerVolume volume,
      BeerBoilVolume boilVolume,
      BeerMethod method,
      BeerIngredients ingredients,
      List<BeerFood> foodPairing,
      BeerBrewersTips brewersTips,
      BeerContributedBy contributedBy});

  $BeerMethodCopyWith<$Res> get method;
  $BeerIngredientsCopyWith<$Res> get ingredients;
}

/// @nodoc
class _$BeerCopyWithImpl<$Res, $Val extends Beer>
    implements $BeerCopyWith<$Res> {
  _$BeerCopyWithImpl(this._value, this._then);

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
    Object? imageUrl = freezed,
    Object? abv = null,
    Object? ibu = freezed,
    Object? targetFg = freezed,
    Object? targetOg = freezed,
    Object? ebc = freezed,
    Object? srm = freezed,
    Object? ph = freezed,
    Object? attenuationLevel = freezed,
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
              as BeerId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as BeerName,
      tagline: null == tagline
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as BeerTagline,
      firstBrewed: null == firstBrewed
          ? _value.firstBrewed
          : firstBrewed // ignore: cast_nullable_to_non_nullable
              as BeerFirstBrewed,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as BeerDescription,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as BeerImageUrl?,
      abv: null == abv
          ? _value.abv
          : abv // ignore: cast_nullable_to_non_nullable
              as BeerAbv,
      ibu: freezed == ibu
          ? _value.ibu
          : ibu // ignore: cast_nullable_to_non_nullable
              as BeerIbu?,
      targetFg: freezed == targetFg
          ? _value.targetFg
          : targetFg // ignore: cast_nullable_to_non_nullable
              as BeerTargetFg?,
      targetOg: freezed == targetOg
          ? _value.targetOg
          : targetOg // ignore: cast_nullable_to_non_nullable
              as BeerTargetOg?,
      ebc: freezed == ebc
          ? _value.ebc
          : ebc // ignore: cast_nullable_to_non_nullable
              as BeerEbc?,
      srm: freezed == srm
          ? _value.srm
          : srm // ignore: cast_nullable_to_non_nullable
              as BeerSrm?,
      ph: freezed == ph
          ? _value.ph
          : ph // ignore: cast_nullable_to_non_nullable
              as BeerPh?,
      attenuationLevel: freezed == attenuationLevel
          ? _value.attenuationLevel
          : attenuationLevel // ignore: cast_nullable_to_non_nullable
              as BeerAttenuationLevel?,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as BeerVolume,
      boilVolume: null == boilVolume
          ? _value.boilVolume
          : boilVolume // ignore: cast_nullable_to_non_nullable
              as BeerBoilVolume,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as BeerMethod,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as BeerIngredients,
      foodPairing: null == foodPairing
          ? _value.foodPairing
          : foodPairing // ignore: cast_nullable_to_non_nullable
              as List<BeerFood>,
      brewersTips: null == brewersTips
          ? _value.brewersTips
          : brewersTips // ignore: cast_nullable_to_non_nullable
              as BeerBrewersTips,
      contributedBy: null == contributedBy
          ? _value.contributedBy
          : contributedBy // ignore: cast_nullable_to_non_nullable
              as BeerContributedBy,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BeerMethodCopyWith<$Res> get method {
    return $BeerMethodCopyWith<$Res>(_value.method, (value) {
      return _then(_value.copyWith(method: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BeerIngredientsCopyWith<$Res> get ingredients {
    return $BeerIngredientsCopyWith<$Res>(_value.ingredients, (value) {
      return _then(_value.copyWith(ingredients: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BeerCopyWith<$Res> implements $BeerCopyWith<$Res> {
  factory _$$_BeerCopyWith(_$_Beer value, $Res Function(_$_Beer) then) =
      __$$_BeerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BeerId id,
      BeerName name,
      BeerTagline tagline,
      BeerFirstBrewed firstBrewed,
      BeerDescription description,
      BeerImageUrl? imageUrl,
      BeerAbv abv,
      BeerIbu? ibu,
      BeerTargetFg? targetFg,
      BeerTargetOg? targetOg,
      BeerEbc? ebc,
      BeerSrm? srm,
      BeerPh? ph,
      BeerAttenuationLevel? attenuationLevel,
      BeerVolume volume,
      BeerBoilVolume boilVolume,
      BeerMethod method,
      BeerIngredients ingredients,
      List<BeerFood> foodPairing,
      BeerBrewersTips brewersTips,
      BeerContributedBy contributedBy});

  @override
  $BeerMethodCopyWith<$Res> get method;
  @override
  $BeerIngredientsCopyWith<$Res> get ingredients;
}

/// @nodoc
class __$$_BeerCopyWithImpl<$Res> extends _$BeerCopyWithImpl<$Res, _$_Beer>
    implements _$$_BeerCopyWith<$Res> {
  __$$_BeerCopyWithImpl(_$_Beer _value, $Res Function(_$_Beer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? tagline = null,
    Object? firstBrewed = null,
    Object? description = null,
    Object? imageUrl = freezed,
    Object? abv = null,
    Object? ibu = freezed,
    Object? targetFg = freezed,
    Object? targetOg = freezed,
    Object? ebc = freezed,
    Object? srm = freezed,
    Object? ph = freezed,
    Object? attenuationLevel = freezed,
    Object? volume = null,
    Object? boilVolume = null,
    Object? method = null,
    Object? ingredients = null,
    Object? foodPairing = null,
    Object? brewersTips = null,
    Object? contributedBy = null,
  }) {
    return _then(_$_Beer(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as BeerId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as BeerName,
      tagline: null == tagline
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as BeerTagline,
      firstBrewed: null == firstBrewed
          ? _value.firstBrewed
          : firstBrewed // ignore: cast_nullable_to_non_nullable
              as BeerFirstBrewed,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as BeerDescription,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as BeerImageUrl?,
      abv: null == abv
          ? _value.abv
          : abv // ignore: cast_nullable_to_non_nullable
              as BeerAbv,
      ibu: freezed == ibu
          ? _value.ibu
          : ibu // ignore: cast_nullable_to_non_nullable
              as BeerIbu?,
      targetFg: freezed == targetFg
          ? _value.targetFg
          : targetFg // ignore: cast_nullable_to_non_nullable
              as BeerTargetFg?,
      targetOg: freezed == targetOg
          ? _value.targetOg
          : targetOg // ignore: cast_nullable_to_non_nullable
              as BeerTargetOg?,
      ebc: freezed == ebc
          ? _value.ebc
          : ebc // ignore: cast_nullable_to_non_nullable
              as BeerEbc?,
      srm: freezed == srm
          ? _value.srm
          : srm // ignore: cast_nullable_to_non_nullable
              as BeerSrm?,
      ph: freezed == ph
          ? _value.ph
          : ph // ignore: cast_nullable_to_non_nullable
              as BeerPh?,
      attenuationLevel: freezed == attenuationLevel
          ? _value.attenuationLevel
          : attenuationLevel // ignore: cast_nullable_to_non_nullable
              as BeerAttenuationLevel?,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as BeerVolume,
      boilVolume: null == boilVolume
          ? _value.boilVolume
          : boilVolume // ignore: cast_nullable_to_non_nullable
              as BeerBoilVolume,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as BeerMethod,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as BeerIngredients,
      foodPairing: null == foodPairing
          ? _value._foodPairing
          : foodPairing // ignore: cast_nullable_to_non_nullable
              as List<BeerFood>,
      brewersTips: null == brewersTips
          ? _value.brewersTips
          : brewersTips // ignore: cast_nullable_to_non_nullable
              as BeerBrewersTips,
      contributedBy: null == contributedBy
          ? _value.contributedBy
          : contributedBy // ignore: cast_nullable_to_non_nullable
              as BeerContributedBy,
    ));
  }
}

/// @nodoc

class _$_Beer implements _Beer {
  _$_Beer(
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
      required final List<BeerFood> foodPairing,
      required this.brewersTips,
      required this.contributedBy})
      : _foodPairing = foodPairing;

  @override
  final BeerId id;
  @override
  final BeerName name;
  @override
  final BeerTagline tagline;
  @override
  final BeerFirstBrewed firstBrewed;
  @override
  final BeerDescription description;
  @override
  final BeerImageUrl? imageUrl;
  @override
  final BeerAbv abv;
  @override
  final BeerIbu? ibu;
  @override
  final BeerTargetFg? targetFg;
  @override
  final BeerTargetOg? targetOg;
  @override
  final BeerEbc? ebc;
  @override
  final BeerSrm? srm;
  @override
  final BeerPh? ph;
  @override
  final BeerAttenuationLevel? attenuationLevel;
  @override
  final BeerVolume volume;
  @override
  final BeerBoilVolume boilVolume;
  @override
  final BeerMethod method;
  @override
  final BeerIngredients ingredients;
  final List<BeerFood> _foodPairing;
  @override
  List<BeerFood> get foodPairing {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foodPairing);
  }

  @override
  final BeerBrewersTips brewersTips;
  @override
  final BeerContributedBy contributedBy;

  @override
  String toString() {
    return 'Beer(id: $id, name: $name, tagline: $tagline, firstBrewed: $firstBrewed, description: $description, imageUrl: $imageUrl, abv: $abv, ibu: $ibu, targetFg: $targetFg, targetOg: $targetOg, ebc: $ebc, srm: $srm, ph: $ph, attenuationLevel: $attenuationLevel, volume: $volume, boilVolume: $boilVolume, method: $method, ingredients: $ingredients, foodPairing: $foodPairing, brewersTips: $brewersTips, contributedBy: $contributedBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Beer &&
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
  _$$_BeerCopyWith<_$_Beer> get copyWith =>
      __$$_BeerCopyWithImpl<_$_Beer>(this, _$identity);
}

abstract class _Beer implements Beer {
  factory _Beer(
      {required final BeerId id,
      required final BeerName name,
      required final BeerTagline tagline,
      required final BeerFirstBrewed firstBrewed,
      required final BeerDescription description,
      required final BeerImageUrl? imageUrl,
      required final BeerAbv abv,
      required final BeerIbu? ibu,
      required final BeerTargetFg? targetFg,
      required final BeerTargetOg? targetOg,
      required final BeerEbc? ebc,
      required final BeerSrm? srm,
      required final BeerPh? ph,
      required final BeerAttenuationLevel? attenuationLevel,
      required final BeerVolume volume,
      required final BeerBoilVolume boilVolume,
      required final BeerMethod method,
      required final BeerIngredients ingredients,
      required final List<BeerFood> foodPairing,
      required final BeerBrewersTips brewersTips,
      required final BeerContributedBy contributedBy}) = _$_Beer;

  @override
  BeerId get id;
  @override
  BeerName get name;
  @override
  BeerTagline get tagline;
  @override
  BeerFirstBrewed get firstBrewed;
  @override
  BeerDescription get description;
  @override
  BeerImageUrl? get imageUrl;
  @override
  BeerAbv get abv;
  @override
  BeerIbu? get ibu;
  @override
  BeerTargetFg? get targetFg;
  @override
  BeerTargetOg? get targetOg;
  @override
  BeerEbc? get ebc;
  @override
  BeerSrm? get srm;
  @override
  BeerPh? get ph;
  @override
  BeerAttenuationLevel? get attenuationLevel;
  @override
  BeerVolume get volume;
  @override
  BeerBoilVolume get boilVolume;
  @override
  BeerMethod get method;
  @override
  BeerIngredients get ingredients;
  @override
  List<BeerFood> get foodPairing;
  @override
  BeerBrewersTips get brewersTips;
  @override
  BeerContributedBy get contributedBy;
  @override
  @JsonKey(ignore: true)
  _$$_BeerCopyWith<_$_Beer> get copyWith => throw _privateConstructorUsedError;
}
