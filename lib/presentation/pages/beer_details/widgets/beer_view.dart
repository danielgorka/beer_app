import 'package:beer_app/domain/beers/models/beer.dart';
import 'package:beer_app/presentation/pages/beer_details/widgets/beer_app_bar.dart';
import 'package:beer_app/presentation/pages/beer_details/widgets/beer_content.dart';
import 'package:beer_app/presentation/utils.dart';
import 'package:flutter/cupertino.dart';

class BeerView extends StatelessWidget {
  const BeerView({
    super.key,
    required this.beer,
  });

  final Beer beer;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = _getCrossAxisCount(constraints);
        final isSmall = DisplaySize.isSmall(constraints);
        return CustomScrollView(
          slivers: [
            BeerAppBar(
              isSmall: isSmall,
              beer: beer,
            ),
            BeerContent(
              showDescription: isSmall,
              crossAxisCount: crossAxisCount,
              beer: beer,
            ),
          ],
        );
      },
    );
  }

  int _getCrossAxisCount(BoxConstraints constraints) {
    if (DisplaySize.isSmall(constraints)) {
      return 1;
    } else if (DisplaySize.isMedium(constraints)) {
      return 2;
    } else {
      return 3;
    }
  }
}
