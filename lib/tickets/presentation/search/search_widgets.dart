part of "search_screen.dart";

class _SearchInput extends StatelessWidget {
  const _SearchInput(
      {super.key,
      required this.departureFieldController,
      required this.arrivalFieldController});

  final TextEditingController departureFieldController;
  final TextEditingController arrivalFieldController;

  void swap() {
    var temp = departureFieldController.text;
    departureFieldController.text = arrivalFieldController.text;
    arrivalFieldController.text = temp;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      padding: const EdgeInsets.only(bottom: 16, top: 16, right: 16),
      decoration: BoxDecoration(
          color: BasicColors.grey3, borderRadius: BorderRadius.circular(16.0)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Center(
              child: SizedBox(
                  width: 24,
                  height: 24,
                  child: ElevatedButton(
                    style: AppThemes.buttonTransparentTheme,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset("assets/icons/ic_arrow_back.svg",
                        fit: BoxFit.none, color: BasicColors.white),
                  )),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
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
                      Center(
                        child: SizedBox(
                            width: 24,
                            height: 24,
                            child: ElevatedButton(
                              style: AppThemes.buttonTransparentTheme,
                              onPressed: () => swap(),
                              child: SvgPicture.asset(
                                  "assets/icons/ic_arrow_swap.svg",
                                  fit: BoxFit.none,
                                  color: BasicColors.white),
                            )),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Divider(
                    color: BasicColors.grey4,
                    thickness: 0.0,
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
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
                            child: ElevatedButton(
                              style: AppThemes.buttonTransparentTheme,
                              onPressed: () => arrivalFieldController.clear(),
                              child: SvgPicture.asset(
                                  "assets/icons/ic_cross.svg",
                                  fit: BoxFit.none,
                                  color: BasicColors.grey7),
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchChipList extends StatelessWidget {
  const _SearchChipList({super.key});

  List<_SearchChipItem> get _items => [
        _SearchChipItem(
          text: Text(
            "обратно",
            style: AppTypography(BasicColors.white).title4,
          ),
          callback: () => {},
          icon: SvgPicture.asset("assets/icons/ic_cross_add.svg",
              fit: BoxFit.contain, color: BasicColors.grey7),
        ),
        _SearchChipItem(
          callback: () => {},
          text: Builder(builder: (context) {
            DateTime date = DateTime.now();
            return Row(
              children: [
                Text("${date.day} ${AppDate.months[date.month - 1]}",
                    style: AppTypography(BasicColors.white).title4),
                Text(", ${AppDate.weekdays[date.weekday - 1]}",
                    style: AppTypography(BasicColors.grey6).title4),
              ],
            );
          }),
        ),
        _SearchChipItem(
          callback: () => {},
          text:
              Text("1,эконом", style: AppTypography(BasicColors.white).title4),
          icon: SizedBox.square(
            dimension: 10.0,
            child: SvgPicture.asset("assets/icons/ic_profile.svg",
                fit: BoxFit.contain, color: BasicColors.grey5),
          ),
        ),
        _SearchChipItem(
          callback: () => {},
          text: Text("фильтры", style: AppTypography(BasicColors.white).title4),
          icon: SvgPicture.asset("assets/icons/ic_filter.svg",
              fit: BoxFit.contain, color: BasicColors.white),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => _items[index],
          separatorBuilder: (context, index) => const SizedBox(
                width: 8.0,
              ),
          itemCount: _items.length),
    );
  }
}

class _SearchChipItem extends StatelessWidget {
  const _SearchChipItem(
      {super.key, required this.text, required this.callback, this.icon});
  final Widget text;
  final Widget? icon;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        ElevatedButton(
          style: AppThemes.buttonTransparentTheme,
          onPressed: callback,
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                color: BasicColors.grey3,
                borderRadius: BorderRadius.circular(50)),
            child: Center(
              child: Row(
                children: [
                  Builder(
                      builder: (context) => (icon != null)
                          ? Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: Center(child: icon)),
                            )
                          : Container()),
                  text
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _SearchFlightsList extends StatelessWidget {
  const _SearchFlightsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 288,
      padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
      decoration: BoxDecoration(
          color: BasicColors.grey1, borderRadius: BorderRadius.circular(16.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Прямые рейсы",
            style: AppTypography(BasicColors.white).title2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ListView.separated(
                  // ignore: body_might_complete_normally_nullable
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return _SearchFlightsListItem(
                            circleColor: SpecialColors.red);
                      case 1:
                        return _SearchFlightsListItem(
                            circleColor: SpecialColors.blue);
                      case 2:
                        return _SearchFlightsListItem(
                            circleColor: BasicColors.white);
                    }
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 8.0,
                      ),
                  itemCount: 3),
            ),
          )
        ],
      ),
    );
  }
}

class _SearchFlightsListItem extends StatelessWidget {
  const _SearchFlightsListItem({super.key, required this.circleColor});
  final Color circleColor;

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
        onPressed: () => {},
        child: SizedBox(
          height: 56,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox.square(
                    dimension: 24,
                    child: Container(
                      decoration: BoxDecoration(
                          color: circleColor,
                          borderRadius: BorderRadius.circular(50.0)),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Уральские авиалинии",
                                    style: AppTypography(BasicColors.white)
                                        .title4),
                                const Spacer(),
                                Text(
                                  "2 390 \u20bd",
                                  style:
                                      AppTypography(SpecialColors.blue).title4,
                                ),
                                SizedBox.square(
                                  dimension: 16.0,
                                  child: SvgPicture.asset(
                                    "assets/icons/ic_arrow_forward.svg",
                                    fit: BoxFit.none,
                                    color: SpecialColors.blue,
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                "Loooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong text",
                                style: AppTypography(BasicColors.white).text2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class _SearchShowTicketsButton extends StatelessWidget {
  const _SearchShowTicketsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: AppThemes.buttonTransparentTheme,
        onPressed: () => {},
        child: Container(
          height: 42.0,
          decoration: BoxDecoration(
              color: SpecialColors.blue,
              borderRadius: BorderRadius.circular(8.0)),
          child: Center(
              child: Text(
            "Посмотреть все билеты",
            style: AppTypography(BasicColors.white).butonText1,
          )),
        ));
  }
}

class _SearchSubscribeButton extends StatefulWidget {
  const _SearchSubscribeButton({super.key});

  @override
  State<_SearchSubscribeButton> createState() => _SearchSubscribeButtonState();
}

class _SearchSubscribeButtonState extends State<_SearchSubscribeButton> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51,
      padding: const EdgeInsets.only(left: 16.0, right: 8.0),
      decoration: BoxDecoration(
          color: BasicColors.grey2, borderRadius: BorderRadius.circular(8.0)),
      child: Center(
        child: Row(children: [
          SizedBox.square(
            dimension: 24.0,
            child: SvgPicture.asset(
              "assets/icons/ic_alert.svg",
              fit: BoxFit.none,
              color: SpecialColors.blue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("Подписка на цену",
                style: AppTypography(BasicColors.white).text1),
          ),
          const Spacer(),
          SizedBox(
            width: 50,
            height: 30,
            child: FittedBox(
              fit: BoxFit.contain,
              child: CupertinoSwitch(
                value: _value, 
                activeColor: SpecialColors.blue,
                trackColor: BasicColors.grey5,
                onChanged:(value) {
                setState(() {
                  _value = value;
                });
              },),
            ),
          )
        ]),
      ),
    );
  }
}
