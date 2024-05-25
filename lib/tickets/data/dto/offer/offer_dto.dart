import 'package:tickets_app/tickets/domain/entity/offer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'offer_dto.g.dart';

@JsonSerializable()
class OfferDto extends Offer {
  OfferDto(
      {required super.id,
      required super.title,
      required super.town,
      required super.price
      });

  factory OfferDto.fromJson(Map<String, dynamic> json) {

    return _$OfferDtoFromJson(json);
  }
}