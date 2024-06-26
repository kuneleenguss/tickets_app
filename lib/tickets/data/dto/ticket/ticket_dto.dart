import 'package:json_annotation/json_annotation.dart';
import 'package:tickets_app/tickets/domain/entity/ticket.dart';

part 'ticket_dto.g.dart';

@JsonSerializable()
class TicketDto extends Ticket {
  TicketDto(
      {required super.id,
      super.badge,
      required super.price,
      required super.departureDate,
      required super.departureAirport,
      required super.arrivalDate,
      required super.arrivalAirport,
      required super.has_transfer});

  factory TicketDto.fromJson(Map<String, dynamic> json) {

    return _$TicketDtoFromJson(json);
  }
}
