import 'package:beer_app/domain/beers/models/beer.dart';
import 'package:beer_app/l10n/l10n.dart';
import 'package:beer_app/presentation/pages/beer_details/utils.dart';
import 'package:beer_app/presentation/pages/beers/widgets/beer_image_view.dart';
import 'package:beer_app/presentation/pages/beers/widgets/favourite_beer_button.dart';
import 'package:flutter/material.dart';

class BeerAppBar extends StatelessWidget {
  const BeerAppBar({
    super.key,
    required this.isSmall,
    required this.beer,
  });

  final bool isSmall;
  final Beer beer;

  @override
  Widget build(BuildContext context) {
    final pinned = isSmall;
    final collapsedHeight = isSmall ? null : expandedAppBarHeight;
    final titlePadding = isSmall ? null : EdgeInsets.zero;

    //TODO: Add fading tagline for isSmall
    final title = isSmall
        ? Text(
            beer.name.value,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.center,
            maxLines: 1,
          )
        : null;

    final background = isSmall
        ? Padding(
            padding: const EdgeInsets.all(16).copyWith(bottom: 72),
            child: BeerImageView(
              imageUrl: beer.imageUrl,
            ),
          )
        : _LargeBeerAppBarBackground(beer: beer);

    return SliverAppBar(
      pinned: pinned,
      elevation: 0,
      expandedHeight: expandedAppBarHeight,
      collapsedHeight: collapsedHeight,
      actions: const [
        Padding(
          padding: EdgeInsets.all(8),
          child: FavouriteBeerButton(
            //TODO
            favourite: false,
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: titlePadding,
        stretchModes: const [],
        title: title,
        background: Material(child: background),
      ),
    );
  }
}

class _LargeBeerAppBarBackground extends StatelessWidget {
  const _LargeBeerAppBarBackground({
    required this.beer,
  });

  final Beer beer;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: largeAppBarWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: BeerImageView(
                  imageUrl: beer.imageUrl,
                ),
              ),
            ),
            Flexible(
              flex: 6,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    beer.name.value,
                    style: Theme.of(context).textTheme.headlineLarge,
                    overflow: TextOverflow.fade,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    beer.description.value,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 7,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    context.l10n.firstBrewed(beer.firstBrewed.stringValue),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
