import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:tickets_app/tickets/data/dto/offer/offer_dto.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://run.mocky.io/v3/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/214a1713-bac0-4853-907c-a1dfc3cd05fd')
  Future<OfferDto> getOffers();
}