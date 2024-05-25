import 'package:json_annotation/json_annotation.dart';
import 'package:tickets_app/tickets/domain/entity/ticket_offer.dart';

part 'ticket_offer_dto.g.dart';

@JsonSerializable()
class TicketOfferDto extends TicketOffer {
  TicketOfferDto(
      {required super.id,
      required super.title,
      required super.time_range,
      required super.price});

  factory TicketOfferDto.fromJson(Map<String, dynamic> json) {

    return _$TicketOfferDtoFromJson(json);
  }
}
