// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_offer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketOfferDto _$TicketOfferDtoFromJson(Map<String, dynamic> json) =>
    TicketOfferDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      time_range: (json['time_range'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      price: (json['price']['value'] as num).toInt(),
    );

Map<String, dynamic> _$TicketOfferDtoToJson(TicketOfferDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'time_range': instance.time_range,
      'price': instance.price,
    };
