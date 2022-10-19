import 'package:beer_app/l10n/l10n.dart';
import 'package:beer_app/presentation/routes/router.dart';
import 'package:beer_app/presentation/theme.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightScheme, darkScheme) {
        return MaterialApp.router(
          onGenerateTitle: (context) => context.l10n.appName,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: AppTheme.light(lightScheme),
          darkTheme: AppTheme.dark(darkScheme),
          routeInformationParser: _router.defaultRouteParser(),
          routerDelegate: _router.delegate(),
        );
      },
    );
  }
}
