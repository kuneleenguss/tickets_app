import 'package:tickets_app/tickets/data/dto/ticket_offer/ticket_offer_dto.dart';
import 'package:tickets_app/tickets/domain/entity/offer.dart';

abstract class TicketOfferRepository {
  Future<List<TicketOfferDto>> getTicketOffers();
}