import 'package:tickets_app/tickets/data/dto/dto.dart';
import 'package:tickets_app/tickets/domain/entity/offer.dart';

abstract class TicketRepository {
  Future<List<TicketDto>> getTickets();
}