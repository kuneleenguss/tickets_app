import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tickets_app/common/colors.dart';
import 'package:tickets_app/common/typography.dart';
import 'package:tickets_app/common/themes.dart';
import 'package:tickets_app/tickets/presentation/tickets/cubit/tickets_cubit.dart';

part "tickets_widgets.dart";

class TicketsScreen extends StatelessWidget {
  const TicketsScreen(
      {super.key, required this.departureCity, required this.arrivalCity});
  final String departureCity;
  final String arrivalCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        clipBehavior: Clip.none,
        color: BasicColors.black,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          children: [
            _TicketsInfoLabel(
              departureCity: departureCity,
              arrivalCity: arrivalCity,
            ),
            SizedBox(height: 26.0),
            _TicketsList()
          ],
        ),
      ),
    );
  }
}
