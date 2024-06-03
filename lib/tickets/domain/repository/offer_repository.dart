import 'package:tickets_app/tickets/data/dto/offer/offer_dto.dart';

abstract class OfferRepository {
  Future<List<OfferDto>> getOffers();
}