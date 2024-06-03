import 'package:tickets_app/tickets/data/dto/offer/offer_dto.dart';
import 'package:tickets_app/tickets/data/source/network/service/api_client.dart';
import 'package:tickets_app/tickets/domain/repository/offer_repository.dart';

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
