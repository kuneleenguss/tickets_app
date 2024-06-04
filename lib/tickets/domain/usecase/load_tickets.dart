part of 'usecase.dart';

class LoadTicketsUseCase {
  LoadTicketsUseCase({required TicketRepository repository})
      : _repository = repository;

  final TicketRepository _repository;

  Future<List<TicketDto>> call() async {
    return await _repository.getTickets();
  }
}