import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SpecificationTile extends StatelessWidget {
  const SpecificationTile({
    super.key,
    required this.title,
    required this.tooltip,
    required this.helpUrl,
    required this.value,
  });

  final String title;
  final String tooltip;
  final String helpUrl;
  final String? value;

  @override
  Widget build(BuildContext context) {
    if (value == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
            child: Text(
              value!,
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.end,
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.help_outline),
            iconSize: 20,
            tooltip: tooltip,
            onPressed: () => launchUrl(Uri.parse(helpUrl)),
          ),
        ],
      ),
    );
  }
}
