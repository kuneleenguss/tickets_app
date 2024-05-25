// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketDto _$TicketDtoFromJson(Map<String, dynamic> json) => TicketDto(
      id: (json['id'] as num).toInt(),
      badge: json['badge'] as String,
      price: (json['price']['value'] as num).toInt(),
      departureDate: json['departure']['date'] as String,
      departureAirport: json['departure']['airport'] as String,
      arrivalDate: json['arrival']['date'] as String,
      arrivalAirport: json['arrival']['airport'] as String,
      has_transfer: json['has_transfer'] as bool,
    );

Map<String, dynamic> _$TicketDtoToJson(TicketDto instance) => <String, dynamic>{
      'id': instance.id,
      'badge': instance.badge,
      'price': instance.price,
      'departureDate': instance.departureDate,
      'departureAirport': instance.departureAirport,
      'arrivalDate': instance.arrivalDate,
      'arrivalAirport': instance.arrivalAirport,
      'hasTransfer': instance.has_transfer,
    };
