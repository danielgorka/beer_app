import 'package:beer_app/application/search/search_bloc.dart';
import 'package:beer_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key});

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SearchAppBarState extends State<SearchAppBar> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode
      ..addListener(_onFocusChanged)
      ..requestFocus();
  }

  void _onFocusChanged() {
    if (_focusNode.hasFocus) {
      context.read<SearchBloc>().add(const SearchEvent.editQuery());
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextField(
        focusNode: _focusNode,
        style: Theme.of(context).textTheme.bodyLarge,
        textInputAction: TextInputAction.search,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: context.l10n.searchForBeers,
        ),
        onChanged: (query) {
          context.read<SearchBloc>().add(SearchEvent.queryChanged(query));
        },
        onSubmitted: (query) {
          context.read<SearchBloc>().add(SearchEvent.submitted(query));
        },
      ),
    );
  }
}
