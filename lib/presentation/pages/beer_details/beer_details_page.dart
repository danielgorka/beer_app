import 'package:auto_route/auto_route.dart';
import 'package:beer_app/application/beer_details/beer_details_bloc.dart';
import 'package:beer_app/domain/beers/models/beer.dart';
import 'package:beer_app/injection.dart';
import 'package:beer_app/presentation/pages/beer_details/widgets/beer_view.dart';
import 'package:beer_app/presentation/widgets/error_view.dart';
import 'package:beer_app/presentation/widgets/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BeerDetailsPage extends StatelessWidget {
  const BeerDetailsPage({
    super.key,
    @PathParam('id') required this.beerId,
    this.beer,
  });

  final int beerId;
  final Beer? beer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<BeerDetailsBloc>()
          ..add(
            BeerDetailsEvent.init(
              beerId: beerId,
              beer: beer,
            ),
          ),
        child: BlocBuilder<BeerDetailsBloc, BeerDetailsState>(
          builder: (context, state) {
            if (state.beer == null && state.errorType != ErrorType.none) {
              return ErrorView(
                onRefresh: () {
                  context
                      .read<BeerDetailsBloc>()
                      .add(BeerDetailsEvent.init(beerId: beerId));
                },
              );
            }

            return LoadingView(
              loading: state.loading,
              child: state.beer != null
                  ? BeerView(
                      beer: state.beer!,
                    )
                  : Container(),
            );
          },
        ),
      ),
    );
  }
}
