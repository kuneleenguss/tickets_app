import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tickets_app/common/colors.dart';
import 'package:tickets_app/common/typography.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BasicColors.black,
      body: Column(
        textDirection: TextDirection.ltr,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 28),
            child: Center(
              child: Text(
                "Поиск дешевых\nавиабилетов",
                textAlign: TextAlign.center,
                style: AppTypography(const Color(0xFFD9D9D9)).title1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 36),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                width: 328,
                height: 122,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: BasicColors.grey3),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: BasicColors.grey4,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 4.0),
                            blurRadius: 4.0)
                      ]),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Center(
                            child: SizedBox(
                                width: 24,
                                height: 24,
                                child: SvgPicture.asset(
                                    "assets/icons/ic_search.svg",
                                    fit: BoxFit.none,
                                    color: BasicColors.black))),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 17.0),
                        child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
