import 'package:equatable/equatable.dart';

class Ticket extends Equatable {
  const Ticket(
      {required this.id,
      required this.badge,
      required this.price,
      required this.departureDate,
      required this.departureAirport,
      required this.arrivalDate,
      required this.arrivalAirport,
      required this.hasTransfer});

  final int id;
  final String badge;
  final int price;
  final String departureDate;
  final String departureAirport;
  final String arrivalDate;
  final String arrivalAirport;
  final bool hasTransfer;
  
  @override
  List<Object?> get props => [
    id,
    badge,
    price,
    departureDate,
    departureAirport,
    arrivalDate,
    arrivalAirport,
    hasTransfer
  ];
}
