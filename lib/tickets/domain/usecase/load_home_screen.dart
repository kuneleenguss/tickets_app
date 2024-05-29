import 'package:tickets_app/tickets/data/dto/offer/offer_dto.dart';
import 'package:tickets_app/tickets/domain/repository/offer_repository.dart';

class LoadHomeScreenUseCase {
  LoadHomeScreenUseCase({required OfferRepository repository})
      : _repository = repository;

  final OfferRepository _repository;

  Future<List<OfferDto>> call() async {
    return await _repository.getOffers();
  }
}
