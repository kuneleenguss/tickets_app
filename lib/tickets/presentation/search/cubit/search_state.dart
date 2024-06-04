part of 'search_cubit.dart';

enum SearchStatus { loading, success, error }

class SearchState extends Equatable {
  const SearchState({this.status = SearchStatus.loading, this.ticketOffersList = const []});

  final SearchStatus status;
  final List<TicketOfferDto> ticketOffersList;

  SearchState copyWith({SearchStatus? status, List<TicketOfferDto>? ticketOffersList}) {
    return SearchState(
        status: status ?? this.status, ticketOffersList: ticketOffersList ?? this.ticketOffersList);
  }

  @override
  List<Object> get props => [status, ticketOffersList];
}
