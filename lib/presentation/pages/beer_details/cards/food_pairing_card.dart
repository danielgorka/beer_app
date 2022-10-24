import 'package:beer_app/domain/beers/models/beer.dart';
import 'package:beer_app/l10n/l10n.dart';
import 'package:beer_app/presentation/pages/beer_details/cards/details_card.dart';
import 'package:flutter/material.dart';

class FoodPairingCard extends StatelessWidget {
  const FoodPairingCard({
    super.key,
    required this.beer,
  });

  final Beer beer;

  @override
  Widget build(BuildContext context) {
    return DetailsCard(
      title: context.l10n.foodPairing,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          beer.foodPairing
              .map((foodPairing) => '•  ${foodPairing.value}')
              .join('\n'),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
