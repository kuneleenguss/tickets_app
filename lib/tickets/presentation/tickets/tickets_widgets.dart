part of "tickets_screen.dart";

class _TicketsInfoLabel extends StatelessWidget {
  const _TicketsInfoLabel(
      {super.key, required this.departureCity, required this.arrivalCity});
  final String departureCity;
  final String arrivalCity;

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
              child: ElevatedButton(
                style: AppThemes.buttonTransparentTheme,
                onPressed: () => Navigator.pop(context),
                child: SvgPicture.asset("assets/icons/ic_arrow_back.svg",
                    fit: BoxFit.none, color: SpecialColors.blue),
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${departureCity}-${arrivalCity}",
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

class _TicketsList extends StatefulWidget {
  const _TicketsList({super.key});

  @override
  State<_TicketsList> createState() => _TicketsListState();
}

class _TicketsListState extends State<_TicketsList> {
  void init() async {
    await context.read<TicketsCubit>().getTickets();
  }

  @override
  void initState() {
    // TODO: implement initState
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            BlocBuilder<TicketsCubit, TicketsState>(
              builder: (context, state) {
                final list = state.ticketsList;
                switch (state.status) {
                  case TicketsStatus.loading:
                    return Center(
                      child: Text("Loading...",
                          style: AppTypography(BasicColors.white).title3),
                    );
                  case TicketsStatus.success:
                    return ListView.separated(
                        itemCount: list.length,
                        itemBuilder: (context, index) => _TicketsListItem(
                          price: list[index].price,
                          departureDate: list[index].departureDate,
                          departureAirport: list[index].departureAirport,
                          arrivalDate: list[index].arrivalDate,
                          arrivalAirport: list[index].arrivalAirport,
                          has_transfer: list[index].has_transfer,
                          badge: list[index].badge,
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 16.0,
                            ),);
                  case TicketsStatus.error:
                    return Center(
                      child: Text("Error :(",
                          style: AppTypography(BasicColors.white).title3),
                    );
                }
              },
            ),
            Positioned(
              bottom: 16.0,
              child: Container(
                height: 37,
                width: 205,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: SpecialColors.blue,
                    borderRadius: BorderRadius.circular(50.0)),
                child: Row(
                  children: [
                    ElevatedButton(
                      style: AppThemes.buttonTransparentTheme,
                      onPressed: () => {},
                      child: Row(
                        children: [
                          SizedBox.square(
                            dimension: 16.0,
                            child: SvgPicture.asset(
                                "assets/icons/ic_filter.svg",
                                fit: BoxFit.none,
                                color: BasicColors.white),
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            "Фильтр",
                            style: AppTypography(BasicColors.white).title4,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      style: AppThemes.buttonTransparentTheme,
                      onPressed: () => {},
                      child: Row(
                        children: [
                          SizedBox.square(
                            dimension: 16.0,
                            child: SvgPicture.asset(
                                "assets/icons/ic_graphs.svg",
                                fit: BoxFit.none,
                                color: BasicColors.white),
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            "График цен",
                            style: AppTypography(BasicColors.white).title4,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ]),
    );
  }
}

class _TicketsListItem extends StatelessWidget {
  const _TicketsListItem(
      {super.key,
      this.badge,
      required this.price,
      required this.departureDate,
      required this.departureAirport,
      required this.arrivalDate,
      required this.arrivalAirport,
      required this.has_transfer});
  final String? badge;
  final int price;
  final String departureDate;
  final String departureAirport;
  final String arrivalDate;
  final String arrivalAirport;
  final bool has_transfer;

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
                Text("$price \u20bd",
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
                            Text("$departureDate - $arrivalDate",
                                style: AppTypography(BasicColors.white).title4),
                            SizedBox(width: 16.0),
                            Builder(
                                builder: (context) => has_transfer
                                    ? Text(
                                        "4ч в пути",
                                        style: AppTypography(BasicColors.white)
                                            .text2,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    : Text(
                                        "4ч в пути / Без пересадок",
                                        style: AppTypography(BasicColors.white)
                                            .text2,
                                        overflow: TextOverflow.ellipsis,
                                      ))
                          ],
                        ),
                        SizedBox(height: 4.0),
                        Row(children: [
                          Text(
                            departureAirport,
                            style: AppTypography(BasicColors.grey6).title4,
                          ),
                          SizedBox(width: 20.0),
                          Text(
                            arrivalAirport,
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
          Builder(
              builder: (context) => badge != null
                  ? Positioned(
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
                              badge!,
                              style: AppTypography(BasicColors.white).title4,
                            ),
                          )
                        ],
                      ),
                    )
                  : Container())
        ],
      ),
    );
  }
}
