import 'package:tickets_app/tickets/domain/repository/offer_repository.dart';
import 'package:tickets_app/tickets/domain/repository/ticket_offer_repository.dart';
import 'package:tickets_app/tickets/domain/repository/ticket_repository.dart';

import 'package:tickets_app/tickets/data/dto/dto.dart';

part 'load_offers.dart';
part 'load_ticket_offers.dart';
part 'load_tickets.dart';

class UseCase {
  LoadOffersUseCase getLoadOffersUseCase(OfferRepository repository) {
    return LoadOffersUseCase(repository: repository);
  }

  LoadTicketOffersUseCase getLoadTicketOffersUseCase(
      TicketOfferRepository repository) {
    return LoadTicketOffersUseCase(repository: repository);
  }

  LoadTicketsUseCase getLoadTicketsUseCase(TicketRepository repository) {
    return LoadTicketsUseCase(repository: repository);
  }
}
