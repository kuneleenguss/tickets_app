import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tickets_app/common/typography.dart';
import 'package:tickets_app/tickets/domain/repository/offer_repository.dart';
import 'package:tickets_app/tickets/domain/repository/ticket_offer_repository.dart';
import 'package:tickets_app/tickets/domain/repository/ticket_repository.dart';
import 'package:tickets_app/tickets/domain/usecase/usecase.dart';
import 'common/colors.dart';
import 'tickets/presentation/screens.dart';

import 'package:dio/dio.dart';
import 'package:tickets_app/tickets/data/source/network/service/api_client.dart';
import 'package:tickets_app/tickets/data/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  int _selectedIndex = 0;

  late final LoadOffersUseCase _loadOffers;
  late final LoadTicketOffersUseCase _loadTicketOffers;
  late final LoadTicketsUseCase _loadTickets;

  void init() {
    Dio dio = Dio(BaseOptions(contentType: "application/json"));
    ApiClient client = ApiClient(dio);

    OfferRepository offerRepository = Repository(client: client).offerRepository;
    TicketOfferRepository ticketOfferRepository = Repository(client: client).ticketOfferRepository;
    TicketRepository ticketRepository = Repository(client: client).ticketRepository;

    _loadOffers = UseCase().getLoadOffersUseCase(offerRepository);
    _loadTicketOffers =
        UseCase().getLoadTicketOffersUseCase(ticketOfferRepository);
    _loadTickets = UseCase().getLoadTicketsUseCase(ticketRepository);
    // final list = await _loadOffers();
    // print(list);
  }

  @override
  void initState() {
    // TODO: implement initState
    init();
    super.initState();
  }

  final List<Widget> _widgets = <Widget>[
    HomeScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: _loadOffers,
        ),
        RepositoryProvider.value(
          value: _loadTicketOffers,
        ),
        RepositoryProvider.value(
          value: _loadTickets,
        ),
      ],
      child: Scaffold(
        bottomNavigationBar: SizedBox(
          height: 56,
          child: BottomNavigationBar(
            elevation: 0.0,
            selectedLabelStyle: AppTypography(SpecialColors.blue).tabText,
            unselectedLabelStyle: AppTypography(BasicColors.grey6).tabText,
            backgroundColor: BasicColors.black,
            unselectedItemColor: BasicColors.grey6,
            selectedItemColor: SpecialColors.blue,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: SizedBox(
                      width: 24,
                      height: 24,
                      child: Center(
                          child: SvgPicture.asset(
                              fit: BoxFit.none,
                              "assets/icons/ic_plane.svg",
                              color: BasicColors.grey6))),
                  activeIcon: SizedBox(
                      width: 24,
                      height: 24,
                      child: Center(
                          child: SvgPicture.asset(
                              fit: BoxFit.none,
                              "assets/icons/ic_plane.svg",
                              color: SpecialColors.blue))),
                  label: "Авиабилеты"),
              BottomNavigationBarItem(
                  icon: SizedBox(
                      width: 24,
                      height: 24,
                      child: Center(
                          child: SvgPicture.asset(
                              fit: BoxFit.none,
                              "assets/icons/ic_hotel.svg",
                              color: BasicColors.grey6))),
                  activeIcon: SvgPicture.asset("assets/icons/ic_hotel.svg",
                      color: SpecialColors.blue),
                  label: "Отели"),
              BottomNavigationBarItem(
                  icon: SizedBox(
                      width: 24,
                      height: 24,
                      child: Center(
                          child: SvgPicture.asset(
                              fit: BoxFit.none,
                              "assets/icons/ic_location.svg",
                              color: BasicColors.grey6))),
                  activeIcon: SvgPicture.asset("assets/icons/ic_location.svg",
                      color: SpecialColors.blue),
                  label: "Короче"),
              BottomNavigationBarItem(
                  icon: SizedBox(
                      width: 24,
                      height: 24,
                      child: Center(
                          child: SvgPicture.asset(
                              fit: BoxFit.none,
                              "assets/icons/ic_alert.svg",
                              color: BasicColors.grey6))),
                  activeIcon: SvgPicture.asset("assets/icons/ic_alert.svg",
                      color: SpecialColors.blue),
                  label: "Подписки"),
              BottomNavigationBarItem(
                  icon: SizedBox(
                      width: 24,
                      height: 24,
                      child: Center(
                          child: SvgPicture.asset(
                              fit: BoxFit.none,
                              "assets/icons/ic_profile.svg",
                              color: BasicColors.grey6))),
                  activeIcon: SvgPicture.asset("assets/icons/ic_profile.svg",
                      color: SpecialColors.blue),
                  label: "Профиль"),
            ],
            type: BottomNavigationBarType.fixed,
            onTap: _onItemTapped,
            currentIndex: _selectedIndex,
          ),
        ),
        body: _widgets[0],
      ),
    );
  }
}
