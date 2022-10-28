import 'dart:convert';

import 'package:beer_app/infrastructure/beers/dtos/beer_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

abstract class IFavouritesDataSource implements Listenable {
  Future<List<BeerDto>> getFavouriteBeers();
  Future<bool> isFavouriteBeer(int beerId);
  Future<void> saveFavouriteBeer(BeerDto beer);
  Future<void> removeFavouriteBeer(int beerId);
}

@LazySingleton(as: IFavouritesDataSource)
class FavouritesDataSource extends IFavouritesDataSource {
  FavouritesDataSource({
    required this.hive,
  });

  static const favouritesBoxName = 'favourites';

  final HiveInterface hive;

  final _listeners = <VoidCallback>[];

  @override
  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  @override
  Future<List<BeerDto>> getFavouriteBeers() async {
    final box = await _getFavouritesBox();
    return box.values
        .map((e) => BeerDto.fromJson(jsonDecode(e) as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<bool> isFavouriteBeer(int beerId) async {
    final box = await _getFavouritesBox();
    return box.containsKey(beerId);
  }

  @override
  Future<void> saveFavouriteBeer(BeerDto beer) async {
    final box = await _getFavouritesBox();
    await box.put(beer.id, jsonEncode(beer.toJson()));
    notifyListeners();
  }

  @override
  Future<void> removeFavouriteBeer(int beerId) async {
    final box = await _getFavouritesBox();
    await box.delete(beerId);
    notifyListeners();
  }

  Future<Box<String>> _getFavouritesBox() => hive.openBox(favouritesBoxName);

  @visibleForTesting
  void notifyListeners() {
    for (final listener in _listeners) {
      listener.call();
    }
  }
}
