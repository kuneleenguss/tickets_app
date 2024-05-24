import 'package:tickets_app/tickets/domain/entity/offer.dart';

abstract class OfferRepository {
  Future<List<Offer>> getOffers();
}