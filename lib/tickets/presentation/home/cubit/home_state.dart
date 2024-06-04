part of 'home_cubit.dart';

enum HomeStatus { loading, success, error }

class HomeState extends Equatable {
  const HomeState({this.status = HomeStatus.loading, this.offerList = const []});

  final HomeStatus status;
  final List<OfferDto> offerList;

  HomeState copyWith({HomeStatus? status, List<OfferDto>? offerList}) {
    return HomeState(
        status: status ?? this.status, offerList: offerList ?? this.offerList);
  }

  @override
  List<Object> get props => [status, offerList];
}
