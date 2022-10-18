import 'package:freezed_annotation/freezed_annotation.dart';

part 'beers_failure.freezed.dart';

@freezed
class BeersFailure with _$BeersFailure {
  const factory BeersFailure.notFound() = NotFound;
  const factory BeersFailure.networkError() = NetworkError;
  const factory BeersFailure.unknownError() = UnknownError;
}
