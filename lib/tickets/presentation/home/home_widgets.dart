part of 'home_screen.dart';

class _HomeInput extends StatelessWidget {
  _HomeInput({super.key});

  final TextEditingController _departureFieldController =
      TextEditingController();
  final TextEditingController _arrivalFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 122,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: BasicColors.grey3),
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
                      child: SvgPicture.asset("assets/icons/ic_search.svg",
                          fit: BoxFit.none, color: BasicColors.black))),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Expanded(
                        child: InputField(
                      textController: _departureFieldController,
                      hintText: "Откуда - Москва",
                      callback: () => {},
                    )),
                    const Divider(
                      color: BasicColors.grey5,
                      thickness: 0.0,
                    ),
                    Expanded(
                        child: InputField(
                      textController: _arrivalFieldController,
                      hintText: "Куда - Турция",
                      callback: () async {
                        await showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          useRootNavigator: true,
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return HomeModalWindow(
                              departureFieldController:
                                  _departureFieldController,
                              arrivalFieldController: _arrivalFieldController,
                            );
                          },
                        );
                      },
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeLabel extends StatelessWidget {
  const _HomeLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Поиск дешевых\nавиабилетов",
        textAlign: TextAlign.center,
        style: AppTypography(const Color(0xFFD9D9D9)).title1,
      ),
    );
  }
}

class _HomeOfferListLabel extends StatelessWidget {
  const _HomeOfferListLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Музыкально отлететь",
      textAlign: TextAlign.left,
      style: AppTypography(BasicColors.white).title1,
    );
  }
}

class _HomeOfferList extends StatelessWidget {
  const _HomeOfferList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 213.16,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const Padding(padding: EdgeInsets.only(left: 67));
        },
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return _HomeOfferListCard();
        },
      ),
    );
  }
}

class _HomeOfferListCard extends StatelessWidget {
  const _HomeOfferListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 132,
          height: 133.16,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: BasicColors.white),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text("Die Antwoord",
              style: AppTypography(BasicColors.white).title3),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child:
              Text("Будапешт", style: AppTypography(BasicColors.white).text2),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Row(
            children: [
              SizedBox(
                  width: 24,
                  height: 24,
                  child: SvgPicture.asset("assets/icons/ic_plane.svg",
                      fit: BoxFit.none, color: BasicColors.grey6)),
              Text("от 22 264 \u20bd",
                  style: AppTypography(BasicColors.white).text2),
            ],
          ),
        )
      ],
    );
  }
}
