import 'package:beer_app/domain/beers/value_objects/beer_favourite.dart';
import 'package:beer_app/presentation/assets.dart';
import 'package:beer_app/presentation/theme.dart';
import 'package:beer_app/presentation/widgets/asset_icon.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class FavouriteBeerButton extends StatelessWidget {
  const FavouriteBeerButton({
    super.key,
    required this.favourite,
    required this.onFavouriteChanged,
  });

  final BeerFavourite favourite;
  final ValueChanged<bool> onFavouriteChanged;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black54 : Colors.black12,
            blurRadius: 20,
          ),
        ],
      ),
      child: LikeButton(
        bubblesColor: const BubblesColor(
          dotPrimaryColor: AppTheme.beerColor,
          dotSecondaryColor: AppTheme.beerColor,
        ),
        circleColor: const CircleColor(
          start: AppTheme.beerColor,
          end: AppTheme.beerColor,
        ),
        isLiked: favourite.value,
        onTap: (isLiked) async {
          onFavouriteChanged(!isLiked);
          return !isLiked;
        },
        likeBuilder: (isLiked) {
          return AssetIcon(
            isLiked ? Assets.favMugColored : Assets.favMug,
            size: 32,
            isTwoTone: isLiked,
          );
        },
      ),
    );
  }
}
