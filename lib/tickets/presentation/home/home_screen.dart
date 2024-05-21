import 'package:flutter/material.dart';
import 'package:tickets_app/common/colors.dart';
import 'home_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: BasicColors.black,
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 28),
              child: HomeLabel(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 36, left: 16, right: 16),
              child: HomeInput(),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 32, left: 16),
              child: HomeOfferListLabel(),
              ),
            const Padding(
              padding: EdgeInsets.only(left: 12, top: 25),
              child: HomeOfferList(),
              )
          ],
        ),
      ),
    );
  }
}
