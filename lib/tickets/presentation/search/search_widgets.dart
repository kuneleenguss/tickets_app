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
                    onPressed: () => {},
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
              fit: BoxFit.none, color: BasicColors.grey7),
        ),
        _SearchChipItem(
          callback: () => {},
          text: Text("обратно", style: AppTypography(BasicColors.white).title4),
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
  const _SearchChipItem({super.key, required this.text, required this.callback, this.icon});
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
                              child: SizedBox(width: 16, height: 16, child: icon),
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
