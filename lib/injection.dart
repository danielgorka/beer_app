import 'package:beer_app/bootstrap.dart';
import 'package:beer_app/injection.config.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: false)
void configureDependencies() => $initGetIt(getIt);

@module
abstract class RegisterModule {
  @Named('ApiUrl')
  String get baseUrl => Config.apiUrl;

  @Named('BeersLimit')
  int get beersLimit => Config.beersLimit;

  Dio get dio => Dio();

  HiveInterface get hive => Hive;
}
