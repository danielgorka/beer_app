import 'package:beer_app/infrastructure/beers/beers_data_source.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

class MockBeersDataSource extends Mock implements IBeersDataSource {}

class FakeDioError extends Fake implements DioError {
  @override
  DioErrorType get type => DioErrorType.other;

  @override
  final String message = 'Fake DioError';
}

class FakeHttpStatusDioError extends Fake implements DioError {
  FakeHttpStatusDioError(this.statusCode);

  final int statusCode;

  @override
  DioErrorType get type => DioErrorType.response;

  @override
  Response<dynamic>? get response => Response(
        statusCode: statusCode,
        requestOptions: RequestOptions(path: ''),
      );

  @override
  final String message = 'Fake DioError';
}
