import 'package:beer_app/application/beers/beers_bloc.dart';
import 'package:beer_app/injection.dart';
import 'package:beer_app/presentation/pages/beers/widgets/beers_view.dart';
import 'package:beer_app/presentation/widgets/error_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BeersPage extends StatelessWidget {
  const BeersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<BeersBloc>()..add(const BeersEvent.init()),
        child: BlocBuilder<BeersBloc, BeersState>(
          builder: (context, state) {
            if (state.beers == null && state.errorType != ErrorType.none) {
              return ErrorView(
                onRefresh: () {
                  context.read<BeersBloc>().add(const BeersEvent.init());
                },
              );
            }

            final beersLimit = context.read<BeersBloc>().limit;
            return BeersView(
              showSearchBar: true,
              beers: state.beers,
              hasError: state.errorType != ErrorType.none,
              canLoadMore: state.canLoadMore,
              beersLimit: beersLimit,
              reload: () =>
                  context.read<BeersBloc>().add(const BeersEvent.init()),
              loadMore: () =>
                  context.read<BeersBloc>().add(const BeersEvent.loadMore()),
            );
          },
        ),
      ),
    );
  }
}
