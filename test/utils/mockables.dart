import 'package:auto_route/auto_route.dart';
import 'package:beer_app/application/beer_details/beer_details_bloc.dart';
import 'package:beer_app/application/beers/beers_bloc.dart';
import 'package:beer_app/application/favourites/favourites_bloc.dart';
import 'package:beer_app/application/search/search_bloc.dart';
import 'package:beer_app/domain/beers/i_beers_repository.dart';
import 'package:beer_app/infrastructure/beers/beers_data_source.dart';
import 'package:beer_app/infrastructure/beers/favourites_data_source.dart';
import 'package:beer_app/presentation/routes/router.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mocktail/mocktail.dart';

class MockBox<T> extends Mock implements Box<T> {}

class MockHiveInterface extends Mock implements HiveInterface {}

class MockBeersDataSource extends Mock implements IBeersDataSource {}

class MockFavouritesDataSource extends Mock implements IFavouritesDataSource {}

class MockBeersRepository extends Mock implements IBeersRepository {}

class MockBeersBloc extends MockBloc<BeersEvent, BeersState>
    implements BeersBloc {}

class MockSearchBloc extends MockBloc<SearchEvent, SearchState>
    implements SearchBloc {}

class MockBeerDetailsBloc extends MockBloc<BeerDetailsEvent, BeerDetailsState>
    implements BeerDetailsBloc {}

class MockFavouritesBloc extends MockBloc<FavouritesEvent, FavouritesState>
    implements FavouritesBloc {}

class MockAppRouter extends Mock implements AppRouter {}

class MockCustomPage<T> extends Mock implements CustomPage<T> {}

class MockBuildContext extends Mock implements BuildContext {}

class MockCacheManager extends Mock implements CacheManager {}

class FakeDioError extends Fake implements DioError {
  @override
  DioErrorType get type => DioErrorType.other;

  @override
  final String message = 'Fake DioError';
}

class FakeHttpStatusDioError extends Fake implements DioError {
  FakeHttpStatusDioError(this.statusCode);

  final int statusCode;

  @override
  DioErrorType get type => DioErrorType.response;

  @override
  Response<dynamic>? get response => Response(
        statusCode: statusCode,
        requestOptions: RequestOptions(path: ''),
      );

  @override
  final String message = 'Fake DioError';
}

class MockStackRouter extends RootStackRouter {
  MockStackRouter() : super(null);

  static const main = 'main';
  static const tab1 = '1';
  static const tab2 = '2';
  static const tab3 = '3';
  static const tabText1 = 'Tab 1';
  static const tabText2 = 'Tab 2';
  static const tabText3 = 'Tab 3';

  @override
  final Map<String, PageFactory> pagesMap = {
    main: (routeData) => MaterialPageX<dynamic>(
          routeData: routeData,
          child: Container(),
        ),
    tab1: (routeData) => MaterialPageX<dynamic>(
          routeData: routeData,
          child: const Text(tabText1),
        ),
    tab2: (routeData) => MaterialPageX<dynamic>(
          routeData: routeData,
          child: const Text(tabText2),
        ),
    tab3: (routeData) => MaterialPageX<dynamic>(
          routeData: routeData,
          child: const Text(tabText3),
        ),
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          main,
          path: '/',
          children: [
            RouteConfig(
              tab1,
              path: tab1,
              children: [
                RouteConfig(tab1, path: ''),
              ],
            ),
            RouteConfig(
              tab2,
              path: tab2,
              children: [
                RouteConfig(tab2, path: ''),
              ],
            ),
            RouteConfig(
              tab3,
              path: tab3,
              children: [
                RouteConfig(tab3, path: ''),
              ],
            ),
          ],
        ),
      ];
}
