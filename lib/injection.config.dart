// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:beer_app/domain/beers/i_beers_repository.dart' as _i5;
import 'package:beer_app/infrastructure/beers/beers_data_source.dart' as _i4;
import 'package:beer_app/infrastructure/beers/beers_repository.dart' as _i6;
import 'package:beer_app/injection.dart' as _i7;
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
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
  gh.factory<String>(
    () => registerModule.baseUrl,
    instanceName: 'ApiUrl',
  );
  gh.lazySingleton<_i4.IBeersDataSource>(() => _i4.IBeersDataSource(
        get<_i3.Dio>(),
        baseUrl: get<String>(instanceName: 'ApiUrl'),
      ));
  gh.lazySingleton<_i5.IBeersRepository>(
      () => _i6.BeersRepository(beersDataSource: get<_i4.IBeersDataSource>()));
  return get;
}

class _$RegisterModule extends _i7.RegisterModule {}
