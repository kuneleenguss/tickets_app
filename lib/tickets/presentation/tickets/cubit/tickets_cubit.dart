import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tickets_app/tickets/data/dto/ticket/ticket_dto.dart';
import 'package:tickets_app/tickets/domain/usecase/usecase.dart';

part 'tickets_state.dart';

class TicketsCubit extends Cubit<TicketsState> {
  TicketsCubit({required LoadTicketsUseCase useCase})
      : _loadTickets = useCase,
        super(const TicketsState());

  final LoadTicketsUseCase _loadTickets;

  Future<void> getTickets() async {
    emit(state.copyWith(status: TicketsStatus.loading));

    final list = await _loadTickets();

    emit(state.copyWith(status: TicketsStatus.success, ticketsList: list));
  }
}
