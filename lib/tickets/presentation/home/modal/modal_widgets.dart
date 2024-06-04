part of "modal_screen.dart";

class _HomeModalWindowInput extends StatelessWidget {
  _HomeModalWindowInput(
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
                      child: _HomeModalArrivalInputField(
                        arrivalFieldController: arrivalFieldController,
                        departureFieldController: departureFieldController,
                        hintText: "Куда - Турция",
                      )),
                ),
                Center(
                  child: SizedBox(
                      width: 24,
                      height: 24,
                      child: ElevatedButton(
                        style: AppThemes.buttonTransparentTheme,
                        onPressed: () => arrivalFieldController.clear(),
                        child: SvgPicture.asset("assets/icons/ic_cross.svg",
                            fit: BoxFit.none, color: BasicColors.grey7),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _HomeModalArrivalInputField extends StatefulWidget {
  _HomeModalArrivalInputField(
      {super.key,
      required this.departureFieldController,
      required this.arrivalFieldController,
      required this.hintText});
  final TextEditingController departureFieldController;
  final TextEditingController arrivalFieldController;
  final String hintText;

  @override
  State<_HomeModalArrivalInputField> createState() =>
      _HomeModalArrivalInputFieldState();
}

class _HomeModalArrivalInputFieldState
    extends State<_HomeModalArrivalInputField> {
  final FocusNode _arrivalFieldFocusNode = FocusNode();
  String? currentText;

  @override
  void initState() {
    // TODO: implement initState
    _arrivalFieldFocusNode.addListener(handleArrivalField);
    widget.arrivalFieldController.addListener(handleArrivalField);
    currentText = "text";
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    widget.arrivalFieldController.removeListener(handleArrivalField);
    _arrivalFieldFocusNode.removeListener(handleArrivalField);
    super.dispose();
  }

  void handleArrivalField() async {
    print(_arrivalFieldFocusNode.hasFocus);
    if (_arrivalFieldFocusNode.hasFocus == false &&
        widget.arrivalFieldController.text.isNotEmpty &&
        context.mounted &&
        currentText != widget.arrivalFieldController.text) {
      final navigator = Navigator.of(context);
      final reLoadPage = await navigator.push(
        MaterialPageRoute<SearchScreen>(builder: (_) {
          widget.arrivalFieldController.removeListener(handleArrivalField);
          _arrivalFieldFocusNode.removeListener(handleArrivalField);
          return BlocProvider.value(
            value: BlocProvider.of<SearchCubit>(context),
            child: SearchScreen(
                departureFieldController: widget.departureFieldController,
                arrivalFieldController: widget.arrivalFieldController),
          );
        }),
      );
      if (context.mounted == true && reLoadPage == true) {
        setState(() {
          _arrivalFieldFocusNode.addListener(handleArrivalField);
          widget.arrivalFieldController.addListener(handleArrivalField);
          currentText = widget.arrivalFieldController.text;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // arrivalFieldController.removeListener(handleArrivalField);

    // arrivalFieldController.removeListener(() {
    //     handleArrivalField;
    //   });

    return TextField(
      focusNode: _arrivalFieldFocusNode,
      controller: widget.arrivalFieldController,
      cursorWidth: 1.0,
      cursorColor: BasicColors.white,
      decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.fromLTRB(0, 11, 0, 11),
          hintText: widget.hintText,
          hintStyle: AppTypography(BasicColors.grey6).butonText1),
      style: AppTypography(BasicColors.white).butonText1,
    );
  }
}

class _HomeModalQuickButtons extends StatelessWidget {
  _HomeModalQuickButtons({super.key, required this.arrivalFieldController});
  final TextEditingController arrivalFieldController;

  @override
  Widget build(BuildContext context) {
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
        callback: () {
          arrivalFieldController.text = "Куда угодно";
        },
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

class _HomeModalCityList extends StatelessWidget {
  const _HomeModalCityList({super.key, required this.textEditingController});
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
          _HomeModalCityListItem(
              text: "Стамбул", textEditingController: textEditingController),
          _HomeModalCityListItem(
            text: "Сочи",
            textEditingController: textEditingController,
          ),
          _HomeModalCityListItem(
            text: "Пхукет",
            textEditingController: textEditingController,
          )
        ],
      ),
    );
  }
}

class _HomeModalCityListItem extends StatelessWidget {
  const _HomeModalCityListItem(
      {super.key, required this.text, required this.textEditingController});
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
        onPressed: () => textEditingController.text = text,
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
