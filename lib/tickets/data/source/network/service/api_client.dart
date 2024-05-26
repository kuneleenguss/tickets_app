import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

import '../../../dto/dto.dart';
import '../api.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: Api.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(Api.offersPath)
  Future<Map<String, List<OfferDto>>> getOffers();

  @GET(Api.ticketsOffersPath)
  Future<Map<String, List<TicketOfferDto>>> getTicketOffers();

  @GET(Api.ticketsPath)
  Future<Map<String, List<TicketDto>>> getTickets();
}