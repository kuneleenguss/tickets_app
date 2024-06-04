part of 'usecase.dart';

class LoadOffersUseCase {
  LoadOffersUseCase({required OfferRepository repository})
      : _repository = repository;

  final OfferRepository _repository;

  Future<List<OfferDto>> call() async {
    return await _repository.getOffers();
  }
}
