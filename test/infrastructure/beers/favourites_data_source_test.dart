import 'package:beer_app/infrastructure/beers/favourites_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/mock_values/beer.dart';
import '../../utils/mockables.dart';

void main() {
  group(
    'FavouritesDataSource',
    () {
      late HiveInterface hive;
      late Box<String> box;
      late FavouritesDataSource dataSource;

      var listenerCalls = 0;
      void listener() {
        listenerCalls++;
      }

      setUp(() {
        listenerCalls = 0;
        hive = MockHiveInterface();
        box = MockBox<String>();
        dataSource = FavouritesDataSource(
          hive: hive,
        );

        when(
          () => hive.openBox<String>(
            FavouritesDataSource.favouritesBoxName,
          ),
        ).thenAnswer((_) => Future.value(box));
      });

      group(
        'addListener',
        () {
          test(
            'should add listener',
            () async {
              // act
              dataSource
                ..addListener(() {})
                ..addListener(listener)
                ..notifyListeners();

              // assert
              expect(listenerCalls, 1);
            },
          );
        },
      );

      group(
        'removeListener',
        () {
          test(
            'should remove listener',
            () async {
              // act
              dataSource
                ..addListener(listener)
                ..addListener(() {})
                ..removeListener(listener)
                ..notifyListeners();

              // assert
              expect(listenerCalls, 0);
            },
          );
        },
      );

      group(
        'getFavouriteBeers',
        () {
          test(
            'should return list of favourite beers from box',
            () async {
              // arrange
              when(() => box.values).thenReturn([beerJsonString]);

              // act
              final result = await dataSource.getFavouriteBeers();

              // assert
              expect(result, [beerDto]);
            },
          );
        },
      );

      group(
        'isFavouriteBeer',
        () {
          test(
            'should return true when beer id exists in box',
            () async {
              // arrange
              when(() => box.containsKey(beerId.value)).thenReturn(true);

              // act
              final result = await dataSource.isFavouriteBeer(beerId.value);

              // assert
              expect(result, true);
            },
          );
        },
      );

      group(
        'saveFavouriteBeer',
        () {
          test(
            'should save beer to favourites box and call listeners',
            () async {
              //arrange
              when(() => box.put(beerDto.id, beerJsonString))
                  .thenAnswer((_) => Future.value());

              // act
              dataSource.addListener(listener);
              await dataSource.saveFavouriteBeer(beerDto);

              // assert
              verify(() => box.put(beerDto.id, beerJsonString)).called(1);
              expect(listenerCalls, 1);
            },
          );
        },
      );

      group(
        'removeFavouriteBeer',
        () {
          test(
            'should remove beer from favourites box and call listeners',
            () async {
              //arrange
              when(() => box.delete(beerDto.id))
                  .thenAnswer((_) => Future.value());

              // act
              dataSource.addListener(listener);
              await dataSource.removeFavouriteBeer(beerDto.id);

              // assert
              verify(() => box.delete(beerDto.id)).called(1);
              expect(listenerCalls, 1);
            },
          );
        },
      );
    },
  );
}
