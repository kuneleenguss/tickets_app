import 'package:equatable/equatable.dart';

class Offer extends Equatable {
  const Offer({required this.id, required this.title, required this.town, required this.price});
  
  final int id;
  final String title;
  final String town;
  final int price;
  
  @override
  List<Object?> get props => [
    id,
    title,
    town,
    price
  ];
}