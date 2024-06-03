import 'package:tickets_app/tickets/data/dto/ticket_offer/ticket_offer_dto.dart';

abstract class TicketOfferRepository {
  Future<List<TicketOfferDto>> getTicketOffers();
}