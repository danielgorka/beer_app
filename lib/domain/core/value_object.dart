import 'package:flutter/foundation.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject(this.value);

  final T value;

  @override
  bool operator ==(Object other) {
    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'ValueObject($value)';
}
