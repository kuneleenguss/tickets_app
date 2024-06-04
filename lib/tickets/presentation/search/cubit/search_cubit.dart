import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tickets_app/tickets/data/dto/ticket_offer/ticket_offer_dto.dart';
import 'package:tickets_app/tickets/domain/usecase/usecase.dart';


part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required LoadTicketOffersUseCase useCase})
      : _loadTicketOffers = useCase,
        super(const SearchState());

  final LoadTicketOffersUseCase _loadTicketOffers;

  Future<void> getTicketOffers() async {
    emit(state.copyWith(status: SearchStatus.loading));

    final list = await _loadTicketOffers();

    emit(state.copyWith(status: SearchStatus.success, ticketOffersList: list));
  }
}
