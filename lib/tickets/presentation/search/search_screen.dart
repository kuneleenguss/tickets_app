import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tickets_app/common/colors.dart';
import 'package:tickets_app/common/typography.dart';
import 'package:tickets_app/common/widgets/input_field.dart';
import 'package:tickets_app/common/themes.dart';
import 'package:tickets_app/common/date.dart';
import 'package:tickets_app/tickets/domain/usecase/usecase.dart';
import 'package:tickets_app/tickets/presentation/search/cubit/search_cubit.dart';
import '../tickets/tickets_screen.dart';

part "search_widgets.dart";

class SearchScreen extends StatelessWidget {
  SearchScreen(
      {super.key,
      required this.departureFieldController,
      required this.arrivalFieldController});
  final TextEditingController departureFieldController;
  final TextEditingController arrivalFieldController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: BasicColors.black,
        child: ListView(
          padding: const EdgeInsets.only(top: 47.0),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: _SearchInput(
                  departureFieldController: departureFieldController,
                  arrivalFieldController: arrivalFieldController),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 13.0, left: 16.0),
              child: _SearchChipList(),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, top: 12.0, right: 16.0),
              child: _SearchFlightsList(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 23),
              child: _SearchShowTicketsButton(
                callback: () {
                  if (departureFieldController.text.isNotEmpty &&
                      arrivalFieldController.text.isNotEmpty &&
                      context.mounted) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TicketsScreen(
                            departureCity: departureFieldController.text,
                            arrivalCity: arrivalFieldController.text,
                          ),
                        ));
                  }
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 24),
              child: _SearchSubscribeButton(),
            )
          ],
        ),
      ),
    );
  }
}
