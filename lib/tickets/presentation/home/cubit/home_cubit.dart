import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tickets_app/tickets/data/dto/offer/offer_dto.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());
}
