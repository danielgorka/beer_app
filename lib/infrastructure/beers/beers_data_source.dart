import 'package:beer_app/infrastructure/beers/dtos/beer_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'beers_data_source.g.dart';

@RestApi()
abstract class IBeersDataSource {
  factory IBeersDataSource(
    Dio dio, {
    required String baseUrl,
  }) = _IBeersDataSource;

  @GET('/beers')
  Future<List<BeerDto>> getBeers({
    @Query('page') required int page,
    @Query('per_page') required int perPage,
  });

  @GET('/beers/{id}')
  Future<BeerDto> getBeer(@Path('id') int id);
}
