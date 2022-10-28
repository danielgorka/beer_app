import 'package:beer_app/application/favourites/favourites_bloc.dart';
import 'package:beer_app/injection.dart';
import 'package:beer_app/presentation/pages/beers/widgets/beers_view.dart';
import 'package:beer_app/presentation/widgets/error_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            getIt<FavouritesBloc>()..add(const FavouritesEvent.init()),
        child: BlocBuilder<FavouritesBloc, FavouritesState>(
          builder: (context, state) {
            if (state.beers == null && state.hasError) {
              return ErrorView(
                onRefresh: () {
                  context
                      .read<FavouritesBloc>()
                      .add(const FavouritesEvent.init());
                },
              );
            }

            return BeersView(
              showSearchBar: false,
              beers: state.beers,
              hasError: state.hasError,
              canLoadMore: false,
              beersLimit: null,
              reload: () => context
                  .read<FavouritesBloc>()
                  .add(const FavouritesEvent.init()),
              loadMore: null,
              onFavouriteChanged: (beer, favourite) {
                context.read<FavouritesBloc>().add(
                      FavouritesEvent.favouriteChanged(
                        beer: beer,
                        favourite: favourite,
                      ),
                    );
              },
            );
          },
        ),
      ),
    );
  }
}
