import 'package:beer_app/domain/beers/models/beer.dart';
import 'package:beer_app/presentation/pages/beers/utils.dart';
import 'package:beer_app/presentation/pages/beers/widgets/beer_item.dart';
import 'package:beer_app/presentation/pages/beers/widgets/beer_item_placeholder.dart';
import 'package:beer_app/presentation/widgets/app_shimmer.dart';
import 'package:beer_app/presentation/widgets/error_view.dart';
import 'package:flutter/material.dart';

class BeersView extends StatefulWidget {
  const BeersView({
    super.key,
    required this.beers,
    required this.hasError,
    required this.canLoadMore,
    required this.beersLimit,
    required this.reload,
    required this.loadMore,
  });

  final List<Beer> beers;
  final bool hasError;
  final bool canLoadMore;
  final int beersLimit;
  final VoidCallback reload;
  final VoidCallback loadMore;

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
    if (oldWidget.beers.length != widget.beers.length) {
      _loadMore();
    }
  }

  /// Loads more beers if user has scrolled almost to the end of the list.
  void _loadMore() {
    if (!widget.canLoadMore) return;
    if (widget.hasError) return;
    if (!_controller.hasClients) return;
    if (_controller.position.outOfRange) return;

    final itemsRatio = widget.beers.length / _itemsCount;
    final itemsBound = itemsRatio * _controller.position.maxScrollExtent;

    final extentThreshold = _controller.position.viewportDimension;
    final bound = itemsBound - extentThreshold;

    if (_controller.offset >= bound) {
      widget.loadMore();
    }
  }

  /// Returns number of already loaded items
  /// plus items that is currently loading.
  int get _itemsCount {
    var count = widget.beers.length;
    if (widget.canLoadMore && !widget.hasError) {
      count += widget.beersLimit;
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
          SliverPadding(
            padding: beersViewPadding,
            sliver: SliverGrid(
              gridDelegate: beersGridViewDelegate,
              delegate: SliverChildBuilderDelegate(
                childCount: _itemsCount,
                (context, index) {
                  if (index >= widget.beers.length) {
                    return const AppShimmer(
                      child: BeerItemPlaceholder(),
                    );
                  }

                  return BeerItem(
                    beer: widget.beers[index],
                  );
                },
              ),
            ),
          ),
          if (widget.hasError)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ErrorView(onRefresh: widget.loadMore),
              ),
            ),
        ],
      ),
    );
  }
}
