import 'package:beer_app/domain/beers/models/beer.dart';
import 'package:beer_app/l10n/l10n.dart';
import 'package:beer_app/presentation/pages/beer_details/cards/details_card.dart';
import 'package:beer_app/presentation/pages/beer_details/widgets/specification_tile.dart';
import 'package:flutter/material.dart';

class SpecificationCard extends StatelessWidget {
  const SpecificationCard({
    super.key,
    required this.beer,
  });

  final Beer beer;

  @override
  Widget build(BuildContext context) {
    return DetailsCard(
      title: context.l10n.specification,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SpecificationTile(
            title: context.l10n.abv,
            tooltip: context.l10n.abvText,
            helpUrl: context.l10n.abvUrl,
            value: '${beer.abv.value}%',
          ),
          SpecificationTile(
            title: context.l10n.ibu,
            tooltip: context.l10n.ibuText,
            helpUrl: context.l10n.ibuUrl,
            value: beer.ibu?.value.toString(),
          ),
          SpecificationTile(
            title: context.l10n.ebc,
            tooltip: context.l10n.ebcText,
            helpUrl: context.l10n.ebcUrl,
            value: beer.ebc?.value.toString(),
          ),
          SpecificationTile(
            title: context.l10n.srm,
            tooltip: context.l10n.srmText,
            helpUrl: context.l10n.srmUrl,
            value: beer.srm?.value.toString(),
          ),
          SpecificationTile(
            title: context.l10n.ph,
            tooltip: context.l10n.phText,
            helpUrl: context.l10n.phUrl,
            value: beer.ph?.value.toString(),
          ),
          SpecificationTile(
            title: context.l10n.og,
            tooltip: context.l10n.ogText,
            helpUrl: context.l10n.ogUrl,
            value: beer.targetOg?.value.toString(),
          ),
          SpecificationTile(
            title: context.l10n.fg,
            tooltip: context.l10n.fgText,
            helpUrl: context.l10n.fgUrl,
            value: beer.targetFg?.value.toString(),
          ),
        ],
      ),
    );
  }
}
