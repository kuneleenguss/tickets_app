import 'package:tickets_app/tickets/domain/entity/offer.dart';

abstract class TicketRepository {
  Future<List<Offer>> getTickets();
}