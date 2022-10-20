import 'package:beer_app/l10n/l10n.dart';
import 'package:beer_app/presentation/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
    this.content,
    required this.onRefresh,
  });

  final String? content;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            Assets.spilledBeer,
            width: 150,
          ),
          const SizedBox(height: 16),
          Text(
            content ?? context.l10n.somethingWentWrong,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onRefresh,
            child: Text(context.l10n.tryAgain),
          ),
        ],
      ),
    );
  }
}
