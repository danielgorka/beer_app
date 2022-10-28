import 'package:auto_route/auto_route.dart';
import 'package:beer_app/domain/beers/models/beer.dart';
import 'package:beer_app/presentation/pages/beers/widgets/beer_image_view.dart';
import 'package:beer_app/presentation/pages/beers/widgets/favourite_beer_button.dart';
import 'package:beer_app/presentation/routes/router.dart';
import 'package:beer_app/presentation/utils.dart';
import 'package:flutter/material.dart';

class BeerItem extends StatelessWidget {
  const BeerItem({
    super.key,
    required this.beer,
    required this.onFavouriteChanged,
  });

  final Beer beer;
  final ValueChanged<bool> onFavouriteChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: borderRadius,
      onTap: () {
        context.router.push(
          BeerDetailsRoute(
            beerId: beer.id.value,
            beer: beer,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: BeerImageView(
                        imageUrl: beer.imageUrl,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${beer.name.value}\n\n',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: FavouriteBeerButton(
                favourite: beer.favourite,
                onFavouriteChanged: onFavouriteChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
