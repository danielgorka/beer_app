import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

typedef ToggleWidgetBuilder = Widget Function(
  BuildContext context,
  bool toggle,
);

const _toggleKey = Key('toggle');

class WidgetSwitcher extends StatefulWidget {
  const WidgetSwitcher({
    super.key,
    required this.builder,
  });

  final ToggleWidgetBuilder builder;

  static Future<void> toggle(WidgetTester tester) {
    return tester.tap(find.byKey(_toggleKey));
  }

  @override
  State<WidgetSwitcher> createState() => _WidgetSwitcherState();
}

class _WidgetSwitcherState extends State<WidgetSwitcher> {
  bool toggle = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: widget.builder(context, toggle),
        ),
        ElevatedButton(
          key: _toggleKey,
          onPressed: () => setState(() => toggle = !toggle),
          child: Container(),
        ),
      ],
    );
  }
}
