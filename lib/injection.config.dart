// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:beer_app/application/beer_details/beer_details_bloc.dart'
    as _i10;
import 'package:beer_app/application/beers/beers_bloc.dart' as _i11;
import 'package:beer_app/application/favourites/favourites_bloc.dart' as _i12;
import 'package:beer_app/application/search/search_bloc.dart' as _i9;
import 'package:beer_app/domain/beers/i_beers_repository.dart' as _i7;
import 'package:beer_app/infrastructure/beers/beers_data_source.dart' as _i6;
import 'package:beer_app/infrastructure/beers/beers_repository.dart' as _i8;
import 'package:beer_app/infrastructure/beers/favourites_data_source.dart'
    as _i5;
import 'package:beer_app/injection.dart' as _i13;
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i4;
import 'package:injectable/injectable.dart'
    as _i2; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<_i3.Dio>(() => registerModule.dio);
  gh.factory<_i4.HiveInterface>(() => registerModule.hive);
  gh.lazySingleton<_i5.IFavouritesDataSource>(
      () => _i5.FavouritesDataSource(hive: get<_i4.HiveInterface>()));
  gh.factory<String>(
    () => registerModule.baseUrl,
    instanceName: 'ApiUrl',
  );
  gh.factory<int>(
    () => registerModule.beersLimit,
    instanceName: 'BeersLimit',
  );
  gh.lazySingleton<_i6.IBeersDataSource>(() => _i6.IBeersDataSource(
        get<_i3.Dio>(),
        baseUrl: get<String>(instanceName: 'ApiUrl'),
      ));
  gh.lazySingleton<_i7.IBeersRepository>(() => _i8.BeersRepository(
        beersDataSource: get<_i6.IBeersDataSource>(),
        favouritesDataSource: get<_i5.IFavouritesDataSource>(),
      ));
  gh.factory<_i9.SearchBloc>(() => _i9.SearchBloc(
        limit: get<int>(instanceName: 'BeersLimit'),
        beersRepository: get<_i7.IBeersRepository>(),
      ));
  gh.factory<_i10.BeerDetailsBloc>(
      () => _i10.BeerDetailsBloc(beersRepository: get<_i7.IBeersRepository>()));
  gh.factory<_i11.BeersBloc>(() => _i11.BeersBloc(
        limit: get<int>(instanceName: 'BeersLimit'),
        beersRepository: get<_i7.IBeersRepository>(),
      ));
  gh.factory<_i12.FavouritesBloc>(
      () => _i12.FavouritesBloc(beersRepository: get<_i7.IBeersRepository>()));
  return get;
}

class _$RegisterModule extends _i13.RegisterModule {}
