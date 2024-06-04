part of 'repository.dart';

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
