import 'package:beer_app/presentation/pages/beers/widgets/beer_placeholder.dart';
import 'package:beer_app/presentation/widgets/text_placeholder.dart';
import 'package:flutter/material.dart';

class BeerItemPlaceholder extends StatelessWidget {
  const BeerItemPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Expanded(
            child: BeerPlaceholder(),
          ),
          SizedBox(height: 8),
          TextPlaceholder(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
            height: 16,
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
