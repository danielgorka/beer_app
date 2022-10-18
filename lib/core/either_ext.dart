import 'package:dartz/dartz.dart';

extension EitherExt<L, R> on Either<L, R> {
  R get right => fold(
        (left) => throw StateError('Unexpected left value'),
        (right) => right,
      );

  L get left => fold(
        (left) => left,
        (right) => throw StateError('Unexpected right value'),
      );
}
