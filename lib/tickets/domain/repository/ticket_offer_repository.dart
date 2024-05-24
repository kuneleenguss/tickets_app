import 'package:tickets_app/tickets/domain/entity/offer.dart';

abstract class TicketOfferRepository {
  Future<List<Offer>> getTicketOffers();
}