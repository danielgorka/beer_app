import 'package:beer_app/application/search/search_bloc.dart';
import 'package:beer_app/l10n/l10n.dart';
import 'package:beer_app/presentation/app_icons.dart';
import 'package:beer_app/presentation/pages/beers/widgets/beers_view.dart';
import 'package:beer_app/presentation/utils.dart';
import 'package:beer_app/presentation/widgets/error_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: standardAnimDuration,
          child: _getView(context, state),
        );
      },
    );
  }

  Widget _getView(BuildContext context, SearchState state) {
    if (state.beers == null && state.errorType != ErrorType.none) {
      return ErrorView(
        onRefresh: () {
          context.read<SearchBloc>().add(const SearchEvent.init());
        },
      );
    }

    if (!state.isSubmitted) {
      return const _SuggestionPlaceholder();
    }

    final beersLimit = context.read<SearchBloc>().limit;
    return BeersView(
      showSearchBar: false,
      beers: state.beers,
      hasError: state.errorType != ErrorType.none,
      canLoadMore: state.canLoadMore,
      beersLimit: beersLimit,
      reload: () =>
          context.read<SearchBloc>().add(SearchEvent.submitted(state.query)),
      loadMore: () =>
          context.read<SearchBloc>().add(const SearchEvent.loadMore()),
      onFavouriteChanged: (beer, favourite) {
        context.read<SearchBloc>().add(
              SearchEvent.favouriteChanged(
                beer: beer,
                favourite: favourite,
              ),
            );
      },
    );
  }
}

class _SuggestionPlaceholder extends StatelessWidget {
  const _SuggestionPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(AppIcons.search, size: 100),
          Text(
            context.l10n.searchForBeers,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
