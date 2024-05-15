import 'package:flutter/material.dart';
import 'package:tickets_app/common/colors.dart';
import 'modal_widgets.dart';

class HomeModalWindow extends StatelessWidget {
  const HomeModalWindow({super.key, required this.departureFieldController, required this.arrivalFieldController});
  final TextEditingController departureFieldController;
  final TextEditingController arrivalFieldController;
  String get text => departureFieldController.text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      height: MediaQuery.of(context).size.height - 24,
      decoration: BoxDecoration(
          color: BasicColors.grey2, borderRadius: BorderRadius.circular(16.0)),
      child: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Container(
                height: 5,
                width: 38,
                decoration: BoxDecoration(
                    color: BasicColors.grey5,
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: HomeModalWindowInput(
                departureFieldController: departureFieldController,
                arrivalFieldController: arrivalFieldController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: HomeModalQuickButtons(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 21, right: 11),
              child: HomeModalCityList(textEditingController: arrivalFieldController,),
              )
          ],
        ),
      ),
    );
  }
}
