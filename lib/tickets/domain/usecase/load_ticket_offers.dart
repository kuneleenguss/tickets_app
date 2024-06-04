part of 'usecase.dart';

class LoadTicketOffersUseCase {
  LoadTicketOffersUseCase({required TicketOfferRepository repository})
      : _repository = repository;

  final TicketOfferRepository _repository;

  Future<List<TicketOfferDto>> call() async {
    return await _repository.getTicketOffers();
  }
}