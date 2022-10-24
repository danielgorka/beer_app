import 'package:beer_app/domain/beers/models/beer.dart';
import 'package:beer_app/l10n/l10n.dart';
import 'package:beer_app/presentation/pages/beer_details/cards/food_pairing_card.dart';
import 'package:beer_app/presentation/pages/beer_details/cards/specification_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BeerContent extends StatelessWidget {
  const BeerContent({
    super.key,
    required this.showDescription,
    required this.crossAxisCount,
    required this.beer,
  });

  final bool showDescription;
  final int crossAxisCount;
  final Beer beer;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: MasonryGridView.custom(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        crossAxisSpacing: 16,
        gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
        ),
        childrenDelegate: SliverChildListDelegate(
          [
            if (showDescription) ...[
              Center(
                child: SizedBox(
                  width: 500,
                  child: Text(
                    beer.description.value,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                context.l10n.firstBrewed(beer.firstBrewed.stringValue),
                textAlign: TextAlign.center,
              ),
            ],
            SpecificationCard(beer: beer),
            FoodPairingCard(beer: beer),
          ],
        ),
      ),
    );
  }
}
