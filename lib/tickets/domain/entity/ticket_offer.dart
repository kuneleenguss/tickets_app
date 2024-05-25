import 'package:equatable/equatable.dart';

class TicketOffer extends Equatable {
  const TicketOffer({required this.id, required this.title, required this.time_range, required this.price});

  final int id;
  final String title;
  final List<String> time_range;
  final int price;
  
  @override
  List<Object?> get props => [
    id,
    title,
    time_range,
    price
  ];
}