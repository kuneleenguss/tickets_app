part of 'tickets_cubit.dart';

enum TicketsStatus { loading, success, error }

class TicketsState extends Equatable {
  const TicketsState({this.status = TicketsStatus.loading, this.ticketsList = const []});

  final TicketsStatus status;
  final List<TicketDto> ticketsList;

  TicketsState copyWith({TicketsStatus? status, List<TicketDto>? ticketsList}) {
    return TicketsState(
        status: status ?? this.status, ticketsList: ticketsList ?? this.ticketsList);
  }

  @override
  List<Object> get props => [status, ticketsList];
}
