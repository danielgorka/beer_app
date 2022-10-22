import 'package:beer_app/presentation/pages/beers/utils.dart';
import 'package:beer_app/presentation/pages/beers/widgets/beer_item_placeholder.dart';
import 'package:beer_app/presentation/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';

class LoadingBeersView extends StatelessWidget {
  const LoadingBeersView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: GridView.builder(
        padding: beersViewPadding,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: beersGridViewDelegate,
        itemBuilder: (context, index) {
          return const BeerItemPlaceholder();
        },
      ),
    );
  }
}
