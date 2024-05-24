// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferDto _$OfferDtoFromJson(Map<String, dynamic> json) => OfferDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      town: json['town'] as String,
      price: (json['price']['value'] as num).toInt(),
    );

Map<String, dynamic> _$OfferDtoToJson(OfferDto instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'town': instance.town,
      'price': instance.price,
    };
