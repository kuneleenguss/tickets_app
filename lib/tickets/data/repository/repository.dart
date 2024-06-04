import 'package:tickets_app/tickets/data/source/network/service/api_client.dart';
import 'package:tickets_app/tickets/domain/repository/offer_repository.dart';
import 'package:tickets_app/tickets/domain/repository/ticket_offer_repository.dart';
import 'package:tickets_app/tickets/domain/repository/ticket_repository.dart';

import 'package:tickets_app/tickets/data/dto/dto.dart';

part 'offer_repository_impl.dart';
part 'ticket_offer_repository_impl.dart';
part 'ticket_repository_impl.dart';

class Repository {
  Repository({required this.client}) {
    offerRepository = OfferRepositoryImpl(client: client);
    ticketOfferRepository = TicketOfferRepositoryImpl(client: client);
    ticketRepository = TicketRepositoryImpl(client: client);
  }

  final ApiClient client;

  late final OfferRepository offerRepository;
  late final TicketOfferRepository ticketOfferRepository;
  late final TicketRepository ticketRepository;
}
