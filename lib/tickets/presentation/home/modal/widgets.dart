import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tickets_app/common/colors.dart';
import 'package:tickets_app/common/typography.dart';
import 'package:tickets_app/common/widgets/input_field.dart';

class HomeModalWindowInput extends StatelessWidget {
  HomeModalWindowInput(
      {super.key,
      required this.departureFieldController,
      required this.arrivalFieldController});
  final TextEditingController departureFieldController;
  final TextEditingController arrivalFieldController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: BasicColors.grey3, borderRadius: BorderRadius.circular(16.0)),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                SizedBox(
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset("assets/icons/ic_plane_modal.svg",
                        fit: BoxFit.none, color: BasicColors.grey6)),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: InputField(
                      textController: departureFieldController,
                      hintText: "Откуда - Москва",
                      callback: () => {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: BasicColors.grey4,
            thickness: 0.0,
          ),
          Expanded(
            child: Row(
              children: [
                SizedBox(
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset("assets/icons/ic_search.svg",
                        fit: BoxFit.none, color: BasicColors.white)),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: InputField(
                      textController: arrivalFieldController,
                      hintText: "Куда - Турция",
                      callback: () => {},
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset("assets/icons/ic_cross.svg",
                          fit: BoxFit.none, color: BasicColors.grey7)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HomeModalQuickButtons extends StatelessWidget {
  HomeModalQuickButtons({super.key});

  final List<Widget> _buttons = [
    _HomeModalQuickButton(
        buttonColor: SpecialColors.green,
        text: "Сложный\nмаршрут",
        icon: SizedBox(
          width: 24,
          height: 24,
          child: SvgPicture.asset("assets/icons/ic_route.svg",
              fit: BoxFit.none, color: BasicColors.white),
        ),
        callback: () => {}),
    _HomeModalQuickButton(
      buttonColor: SpecialColors.blue,
      text: "Куда угодно",
      callback: () => {},
      icon: SvgPicture.asset("assets/icons/ic_earth_24.svg",
          fit: BoxFit.none, color: BasicColors.white),
    ),
    _HomeModalQuickButton(
      buttonColor: SpecialColors.darkBlue,
      text: "Выходные",
      callback: () => {},
      icon: SvgPicture.asset("assets/icons/ic_calendar_24.svg",
          fit: BoxFit.none, color: BasicColors.white),
    ),
    _HomeModalQuickButton(
      buttonColor: SpecialColors.red,
      text: "Горячие\nбилеты",
      callback: () => {},
      icon: SizedBox(
        width: 24,
        height: 24,
        child: SvgPicture.asset("assets/icons/ic_fire.svg",
            fit: BoxFit.none, color: BasicColors.white),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _buttons,
        ));
  }
}

class _HomeModalQuickButton extends StatelessWidget {
  _HomeModalQuickButton(
      {super.key,
      required this.buttonColor,
      required this.text,
      required this.callback,
      required this.icon});
  final Color buttonColor;
  final String text;
  final VoidCallback callback;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SizedBox(
            width: 48,
            height: 48,
            child: ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              onPressed: callback,
              child: Center(
                  child: SizedBox(
                width: 24,
                height: 24,
                child: icon,
              )),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Center(
              child: Text(text,
                  style: AppTypography(BasicColors.white).text2,
                  textAlign: TextAlign.center)),
        )
      ],
    );
  }
}

class HomeModalCityList extends StatelessWidget {
  const HomeModalCityList({super.key, required this.textEditingController});
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 216,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: BasicColors.grey3, borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _HomeModalCityListItem(text: "Стамбул", textEditingController: textEditingController),
          _HomeModalCityListItem(text: "Сочи", textEditingController: textEditingController,),
          _HomeModalCityListItem(text: "Пхукет", textEditingController: textEditingController,)
        ],
      ),
    );
  }
}

class _HomeModalCityListItem extends StatelessWidget {
  const _HomeModalCityListItem({super.key, required this.text, required this.textEditingController});
  final String text;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          surfaceTintColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            const LinearBorder(
              side: BorderSide(color: BasicColors.grey4, width: 0.0),
              bottom: LinearBorderEdge(),
            ),
          ),
        ),
        onPressed: () => {
          textEditingController.text = text
        },
        child: SizedBox(
          height: 56,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Center(
              child: Row(
                children: [
                  SizedBox.square(
                    dimension: 40,
                    child: Container(
                      decoration: BoxDecoration(
                          color: BasicColors.white,
                          borderRadius: BorderRadius.circular(8.0)),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(text,
                              style: AppTypography(BasicColors.white).title3),
                          Text("Популярное направление",
                              style: AppTypography(BasicColors.grey5).text2)
                        ],
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
