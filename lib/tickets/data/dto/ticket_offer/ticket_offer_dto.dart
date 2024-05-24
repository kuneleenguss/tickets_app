import 'package:json_annotation/json_annotation.dart';
import 'package:tickets_app/tickets/domain/entity/ticket_offer.dart';

part 'ticket_offer_dto.g.dart';

@JsonSerializable()
class TicketOfferDto extends TicketOffer {
  TicketOfferDto(
      {required super.id,
      required super.title,
      required super.timeRange,
      required super.price});

factory TicketOfferDto.fromJson(Map<String, dynamic> json) => _$TicketOfferDtoFromJson(json);
}
