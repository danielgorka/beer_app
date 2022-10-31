import 'package:beer_app/presentation/app_icons.dart';
import 'package:beer_app/presentation/pages/search/search_page.dart';
import 'package:beer_app/presentation/utils.dart';
import 'package:beer_app/presentation/widgets/animated_fade_scale.dart';
import 'package:beer_app/presentation/widgets/material_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:open_container/open_container.dart';

const searchBarHeight = 56.0;

class SliverSearchBar extends StatefulWidget {
  const SliverSearchBar({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  State<SliverSearchBar> createState() => _SliverSearchBarState();
}

class _SliverSearchBarState extends State<SliverSearchBar> {
  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      child: SliverPersistentHeader(
        pinned: true,
        delegate: _SliverSearchBarDelegate(
          topPadding: topPadding,
          title: widget.title,
          onTap: widget.onTap,
        ),
      ),
    );
  }
}

class _SliverSearchBarDelegate extends SliverPersistentHeaderDelegate {
  const _SliverSearchBarDelegate({
    required this.topPadding,
    required this.title,
    required this.onTap,
  });

  final double topPadding;
  final String title;
  final VoidCallback onTap;

  @override
  double get minExtent => topPadding + searchBarHeight;

  @override
  double get maxExtent => minExtent;

  @override
  bool shouldRebuild(covariant _SliverSearchBarDelegate oldDelegate) {
    return topPadding != oldDelegate.topPadding;
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return FlexibleSpaceBar.createSettings(
      minExtent: minExtent,
      maxExtent: maxExtent,
      currentExtent: minExtent,
      child: _FloatingHeader(
        child: _SearchBar(
          title: title,
          onTap: onTap,
        ),
      ),
    );
  }
}

class _FloatingHeader extends StatefulWidget {
  const _FloatingHeader({
    required this.child,
  });

  final Widget child;

  @override
  State<_FloatingHeader> createState() => _FloatingHeaderState();
}

class _FloatingHeaderState extends State<_FloatingHeader> {
  ScrollPosition? _position;
  bool _visible = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _position?.removeListener(_scrollListener);
    _position = Scrollable.of(context)?.position;
    _position?.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_position == null) return;
    final visible = _position!.userScrollDirection == ScrollDirection.forward;
    if (_visible != visible) {
      setState(() => _visible = visible);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedFadeScale(
      visible: _visible,
      duration: shortAnimDuration,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _position?.removeListener(_scrollListener);
    super.dispose();
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: OpenContainer(
            tag: SearchPage,
            color: Theme.of(context).canvasColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(searchBarHeight / 2),
              ),
            ),
            builder: (context) {
              return MaterialCard(
                elevation: ElevationLevel.level3,
                child: InkWell(
                  borderRadius: borderRadius,
                  onTap: onTap,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
                    child: Row(
                      children: [
                        const Icon(AppIcons.search),
                        const SizedBox(width: 16),
                        Text(
                          title,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
