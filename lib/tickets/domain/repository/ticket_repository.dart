import 'package:tickets_app/tickets/data/dto/dto.dart';

abstract class TicketRepository {
  Future<List<TicketDto>> getTickets();
}