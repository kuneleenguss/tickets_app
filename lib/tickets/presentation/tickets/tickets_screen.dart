import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tickets_app/common/colors.dart';
import 'package:tickets_app/common/typography.dart';
import 'package:tickets_app/common/widgets/input_field.dart';
import 'package:tickets_app/common/themes.dart';
import 'package:tickets_app/common/date.dart';

part "tickets_widgets.dart";

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      color: BasicColors.black,
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: Column(
        children: [
          _TicketsInfoLabel(),
          SizedBox(height: 26.0),
          _TicketsList()
        ],
      ),
    );
  }
}