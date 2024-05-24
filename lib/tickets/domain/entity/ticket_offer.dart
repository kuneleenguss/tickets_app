import 'package:equatable/equatable.dart';

class TicketOffer extends Equatable {
  const TicketOffer({required this.id, required this.title, required this.timeRange, required this.price});

  final int id;
  final String title;
  final List<String> timeRange;
  final int price;
  
  @override
  List<Object?> get props => [
    id,
    title,
    timeRange,
    price
  ];

}