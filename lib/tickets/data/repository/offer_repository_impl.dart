part of 'repository.dart';

class OfferRepositoryImpl implements OfferRepository {
  OfferRepositoryImpl({required ApiClient client}) : _client = client;

  final ApiClient _client;

  @override
  Future<List<OfferDto>> getOffers() async {
    final jsonResult = await _client.getOffers();
    final List<OfferDto> offerList = jsonResult['offers']!;

    return offerList;
  }
}
