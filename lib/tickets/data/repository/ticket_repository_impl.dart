import 'package:tickets_app/tickets/data/dto/ticket/ticket_dto.dart';
import 'package:tickets_app/tickets/data/source/network/service/api_client.dart';
import 'package:tickets_app/tickets/domain/repository/ticket_repository.dart';

class TicketRepositoryImpl implements TicketRepository {
  TicketRepositoryImpl({required ApiClient client}) : _client = client;
  final ApiClient _client;

  @override
  Future<List<TicketDto>> getTickets() async {
    final jsonResult = await _client.getTickets();
    final List<TicketDto> ticketList = jsonResult['tickets']!;

    return ticketList;
  }
}
