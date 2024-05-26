import 'package:tickets_app/tickets/data/dto/ticket_offer/ticket_offer_dto.dart';
import 'package:tickets_app/tickets/data/source/network/service/api_client.dart';
import 'package:tickets_app/tickets/domain/entity/offer.dart';
import 'package:tickets_app/tickets/domain/repository/ticket_offer_repository.dart';

class TicketOfferRepositoryImpl implements TicketOfferRepository {
  TicketOfferRepositoryImpl({required ApiClient client}) : _client = client;

  final ApiClient _client;

  @override
  Future<List<TicketOfferDto>> getTicketOffers() async {
    final jsonResult = await _client.getTicketOffers();
    final List<TicketOfferDto> ticketOfferList = jsonResult['tickets_offers']!;

    return ticketOfferList;
  }
}
