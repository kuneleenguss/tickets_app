// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketDto _$TicketDtoFromJson(Map<String, dynamic> json) => TicketDto(
      id: (json['id'] as num).toInt(),
      badge: json['badge'] as String,
      price: (json['price'] as num).toInt(),
      departureDate: json['departureDate'] as String,
      departureAirport: json['departureAirport'] as String,
      arrivalDate: json['arrivalDate'] as String,
      arrivalAirport: json['arrivalAirport'] as String,
      hasTransfer: json['hasTransfer'] as bool,
    );

Map<String, dynamic> _$TicketDtoToJson(TicketDto instance) => <String, dynamic>{
      'id': instance.id,
      'badge': instance.badge,
      'price': instance.price,
      'departureDate': instance.departureDate,
      'departureAirport': instance.departureAirport,
      'arrivalDate': instance.arrivalDate,
      'arrivalAirport': instance.arrivalAirport,
      'hasTransfer': instance.hasTransfer,
    };
