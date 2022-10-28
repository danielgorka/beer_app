import 'package:auto_route/auto_route.dart';
import 'package:beer_app/domain/beers/models/beer.dart';
import 'package:beer_app/l10n/l10n.dart';
import 'package:beer_app/presentation/pages/beers/utils.dart';
import 'package:beer_app/presentation/pages/beers/widgets/beer_item.dart';
import 'package:beer_app/presentation/pages/beers/widgets/beer_item_placeholder.dart';
import 'package:beer_app/presentation/routes/router.dart';
import 'package:beer_app/presentation/widgets/app_shimmer.dart';
import 'package:beer_app/presentation/widgets/error_view.dart';
import 'package:beer_app/presentation/widgets/sliver_search_bar.dart';
import 'package:flutter/material.dart';

typedef OnFavouriteChanged = void Function(Beer beer, bool favourite);

class BeersView extends StatefulWidget {
  const BeersView({
    super.key,
    required this.showSearchBar,
    required this.beers,
    required this.hasError,
    required this.canLoadMore,
    required this.beersLimit,
    required this.reload,
    required this.loadMore,
    required this.onFavouriteChanged,
  });

  final bool showSearchBar;
  final List<Beer>? beers;
  final bool hasError;
  final bool canLoadMore;
  final int? beersLimit;
  final VoidCallback reload;
  final VoidCallback? loadMore;
  final OnFavouriteChanged onFavouriteChanged;

  @override
  State<BeersView> createState() => _BeersViewState();
}

class _BeersViewState extends State<BeersView> {
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_loadMore);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadMore();
  }

  @override
  void didUpdateWidget(covariant BeersView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.beers?.length != widget.beers?.length) {
      _loadMore();
    }
  }

  /// Loads more beers if user has scrolled almost to the end of the list.
  void _loadMore() {
    if (!widget.canLoadMore) return;
    if (widget.hasError) return;
    if (!_controller.hasClients) return;
    if (_controller.position.outOfRange) return;

    final itemsRatio = (widget.beers?.length ?? 0) / _itemsCount;
    final itemsBound = itemsRatio * _controller.position.maxScrollExtent;

    final extentThreshold = _controller.position.viewportDimension;
    final bound = itemsBound - extentThreshold;

    if (_controller.offset >= bound) {
      widget.loadMore?.call();
    }
  }

  /// Returns number of already loaded items
  /// plus items that is currently loading.
  int get _itemsCount {
    var count = widget.beers?.length ?? 0;

    if (widget.canLoadMore && !widget.hasError && widget.beersLimit != null) {
      count += widget.beersLimit!;
    }

    return count;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => widget.reload(),
      child: CustomScrollView(
        controller: _controller,
        slivers: [
          if (widget.showSearchBar)
            SliverSearchBar(
              title: context.l10n.searchForBeers,
              onTap: () {
                context.router.push(const SearchRoute());
              },
            ),
          SliverPadding(
            padding: beersViewPadding,
            sliver: SliverGrid(
              gridDelegate: beersGridViewDelegate,
              delegate: SliverChildBuilderDelegate(
                childCount: _itemsCount,
                (context, index) {
                  if (index >= (widget.beers?.length ?? 0)) {
                    return const AppShimmer(
                      child: BeerItemPlaceholder(),
                    );
                  }

                  final beer = widget.beers![index];
                  return BeerItem(
                    beer: beer,
                    onFavouriteChanged: (fav) =>
                        widget.onFavouriteChanged(beer, fav),
                  );
                },
              ),
            ),
          ),
          if (widget.hasError)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ErrorView(onRefresh: widget.loadMore ?? widget.reload),
              ),
            ),
        ],
      ),
    );
  }
}
