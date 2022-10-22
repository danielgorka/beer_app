import 'package:beer_app/domain/beers/models/beer.dart';
import 'package:beer_app/presentation/pages/beers/widgets/beer_image_view.dart';
import 'package:beer_app/presentation/pages/beers/widgets/favourite_beer_button.dart';
import 'package:beer_app/presentation/utils.dart';
import 'package:flutter/material.dart';

class BeerItem extends StatelessWidget {
  const BeerItem({
    super.key,
    required this.beer,
  });

  final Beer beer;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: borderRadius,
      onTap: () {
        //TODO: Open beer details page
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
            const Positioned(
              top: 0,
              right: 0,
              child: FavouriteBeerButton(
                //TODO
                favourite: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
