// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_offer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketOfferDto _$TicketOfferDtoFromJson(Map<String, dynamic> json) =>
    TicketOfferDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      timeRange:
          (json['timeRange'] as List<dynamic>).map((e) => e as String).toList(),
      price: (json['price'] as num).toInt(),
    );

Map<String, dynamic> _$TicketOfferDtoToJson(TicketOfferDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'timeRange': instance.timeRange,
      'price': instance.price,
    };
