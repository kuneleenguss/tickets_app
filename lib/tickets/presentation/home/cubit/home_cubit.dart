import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tickets_app/tickets/data/dto/offer/offer_dto.dart';
import 'package:tickets_app/tickets/domain/usecase/usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required LoadOffersUseCase useCase})
      : _loadOffers = useCase,
        super(const HomeState());

  final LoadOffersUseCase _loadOffers;

  Future<void> getOffers() async {
    emit(state.copyWith(status: HomeStatus.loading));

    final list = await _loadOffers();

    emit(state.copyWith(status: HomeStatus.success, offerList: list));
  }
}
