import 'package:beer_app/application/search/search_bloc.dart';
import 'package:beer_app/injection.dart';
import 'package:beer_app/presentation/pages/search/widgets/search_app_bar.dart';
import 'package:beer_app/presentation/pages/search/widgets/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchBloc>()..add(const SearchEvent.init()),
      child: const Scaffold(
        appBar: SearchAppBar(),
        body: SearchView(),
      ),
    );
  }
}
