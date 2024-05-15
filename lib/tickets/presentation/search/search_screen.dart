import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tickets_app/common/colors.dart';
import 'package:tickets_app/common/typography.dart';
import 'package:tickets_app/common/widgets/input_field.dart';
import 'package:tickets_app/common/themes.dart';

part "search_widgets.dart";

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final TextEditingController departureFieldController =
      TextEditingController();
  final TextEditingController arrivalFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BasicColors.black,
      child: ListView(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 47.0),
        children: [
          _SearchInput(
              departureFieldController: departureFieldController,
              arrivalFieldController: arrivalFieldController),
          const Padding(
            padding: EdgeInsets.only(top: 13.0),
            child: _SearchChipList(),
          )
        ],
      ),
    );
  }
}
