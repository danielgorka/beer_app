import 'package:animations/animations.dart';
import 'package:beer_app/presentation/pages/search/search_page.dart';
import 'package:beer_app/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:open_container/open_container.dart';

import '../../utils/mockables.dart';

void main() {
  group(
    'fadeScale',
    () {
      test(
        'should return FadeScaleTransition with correct arguments',
        () {
          // arrange
          const child = Text('child');
          const animation = AlwaysStoppedAnimation<double>(0);
          const secondaryAnimation = AlwaysStoppedAnimation<double>(1);

          // act
          final result = fadeScale(
            MockBuildContext(),
            animation,
            secondaryAnimation,
            child,
          );

          // assert
          expect(result, isA<FadeScaleTransition>());
          final transition = result as FadeScaleTransition;
          expect(transition.animation, animation);
          expect(transition.child, child);
        },
      );
    },
  );

  group(
    'openContainerSearchRouteBuilder',
    () {
      test(
        'should return OpenContainerRoute with correct arguments',
        () {
          // arrange
          final context = MockBuildContext();
          const child = Text('child');
          final page = MockCustomPage<void>();

          // act
          final result = openContainerSearchRouteBuilder(context, child, page);

          // assert
          expect(result, isA<OpenContainerRoute<void>>());
          final route = result as OpenContainerRoute<void>;
          expect(route.tag, SearchPage);
          expect(route.color, Theme.of(context).canvasColor);
          expect(route.settings, page);
          expect(route.builder(context), child);
        },
      );
    },
  );
}
