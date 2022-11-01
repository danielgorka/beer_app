import 'package:beer_app/domain/beers/models/beer_ingredients.dart';
import 'package:beer_app/l10n/l10n.dart';
import 'package:beer_app/presentation/pages/beer_details/cards/details_card.dart';
import 'package:flutter/material.dart';

class IngredientsCard extends StatelessWidget {
  const IngredientsCard({
    super.key,
    required this.ingredients,
  });

  final BeerIngredients ingredients;

  @override
  Widget build(BuildContext context) {
    return DetailsCard(
      title: context.l10n.ingredients,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _IngredientsSection(
              title: context.l10n.malt,
              ingredients: ingredients.malt
                  .map(
                    (malt) => '${malt.name.value} (${malt.amount.valueString})',
                  )
                  .toList(),
            ),
            const SizedBox(height: 8),
            _IngredientsSection(
              title: context.l10n.hops,
              ingredients: ingredients.hops
                  .map(
                    (hop) => '${hop.name.value} (${hop.amount.valueString})',
                  )
                  .toList(),
            ),
            const SizedBox(height: 8),
            _IngredientsSection(
              title: context.l10n.yeast,
              ingredients: [
                if (ingredients.yeast != null) ingredients.yeast!.value,
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _IngredientsSection extends StatelessWidget {
  const _IngredientsSection({
    required this.title,
    required this.ingredients,
  });

  final String title;
  final List<String> ingredients;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        for (final ingredient in ingredients)
          Text(
            '•  $ingredient',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
      ],
    );
  }
}
