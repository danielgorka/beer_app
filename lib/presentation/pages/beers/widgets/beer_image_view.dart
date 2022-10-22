import 'package:beer_app/domain/beers/value_objects/beer_image_url.dart';
import 'package:beer_app/presentation/pages/beers/widgets/beer_placeholder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class BeerImageView extends StatelessWidget {
  const BeerImageView({
    super.key,
    required this.imageUrl,
    this.cacheManager,
  });

  final BeerImageUrl? imageUrl;
  final CacheManager? cacheManager;

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return const BeerPlaceholder();
    }

    return CachedNetworkImage(
      cacheManager: cacheManager,
      imageUrl: imageUrl!.value,
      placeholder: (context, url) => const BeerPlaceholder(),
      errorWidget: (context, url, error) => const BeerPlaceholder(),
    );
  }
}
