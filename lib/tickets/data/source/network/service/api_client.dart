import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import '../../../dto/dto.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://run.mocky.io/v3/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/214a1713-bac0-4853-907c-a1dfc3cd05fd')
  Future<OfferDto> getOffers();

  @GET('/7e55bf02-89ff-4847-9eb7-7d83ef884017')
  Future<TicketOfferDto> getTicketOffers();

  @GET('/670c3d56-7f03-4237-9e34-d437a9e56ebf')
  Future<TicketDto> getTickets();
}