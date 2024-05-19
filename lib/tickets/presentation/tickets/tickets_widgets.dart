part of "tickets_screen.dart";

class _TicketsInfoLabel extends StatelessWidget {
  const _TicketsInfoLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      color: BasicColors.grey2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: SizedBox.square(
              dimension: 24.0,
              child: SvgPicture.asset("assets/icons/ic_arrow_back.svg",
                  fit: BoxFit.none, color: SpecialColors.blue),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Москва-Сочи",
                    style: AppTypography(BasicColors.white).title3),
                Text("23 февраля, 1 пассажир",
                    style: AppTypography(BasicColors.grey6).title4)
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class _TicketsList extends StatelessWidget {
  const _TicketsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) => _TicketsListItem(),
          separatorBuilder: (context, index) => SizedBox(
                height: 24.0,
              ),
          itemCount: 5),
    );
  }
}

class _TicketsListItem extends StatelessWidget {
  const _TicketsListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 117,
            padding: const EdgeInsets.only(left: 16.0, top: 21.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: BasicColors.grey1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("6 990 \u20bd",
                    style: AppTypography(BasicColors.white).title1),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox.square(
                        dimension: 24,
                        child: Container(
                          decoration: BoxDecoration(
                              color: SpecialColors.red,
                              borderRadius: BorderRadius.circular(50.0)),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("03:15 - 07:10",
                                style: AppTypography(BasicColors.white).title4),
                            SizedBox(width: 16.0),
                            Text("4ч в пути / Без пересадок",
                                style: AppTypography(BasicColors.white).text2)
                          ],
                        ),
                        SizedBox(height: 4.0),
                        Row(children: [
                          Text(
                            "VKO",
                            style: AppTypography(BasicColors.grey6).title4,
                          ),
                          SizedBox(width: 26.0),
                          Text(
                            "AER",
                            style: AppTypography(BasicColors.grey6).title4,
                          ),
                        ])
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: -8.0,
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 2.0, bottom: 2.0),
                  decoration: BoxDecoration(
                      color: SpecialColors.blue,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Text(
                    "Самый удобный",
                    style: AppTypography(BasicColors.white).title4,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
