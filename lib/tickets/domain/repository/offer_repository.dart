import 'package:tickets_app/tickets/data/dto/offer/offer_dto.dart';
import 'package:tickets_app/tickets/domain/entity/offer.dart';

abstract class OfferRepository {
  Future<List<OfferDto>> getOffers();
}