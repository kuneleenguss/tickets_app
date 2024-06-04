part of 'repository.dart';

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
