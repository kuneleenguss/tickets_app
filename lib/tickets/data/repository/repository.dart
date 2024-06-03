import 'package:tickets_app/tickets/data/source/network/service/api_client.dart';

import 'offer_repository_impl.dart';
import 'ticket_offer_repository_impl.dart';
import 'ticket_repository_impl.dart';

class Repository {
  Repository({required this.client}) {
    offerRepository = OfferRepositoryImpl(client: client);
    ticketOfferRepository = TicketOfferRepositoryImpl(client: client);
    ticketRepository = TicketRepositoryImpl(client: client);
  }

  final ApiClient client;

  late final offerRepository;
  late final ticketOfferRepository;
  late final ticketRepository;
}
