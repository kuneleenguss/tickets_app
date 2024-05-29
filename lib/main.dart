import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tickets_app/common/typography.dart';
import 'package:tickets_app/tickets/data/repository/offer_repository_impl.dart';
import 'package:tickets_app/tickets/data/repository/ticket_offer_repository_impl.dart';
import 'package:tickets_app/tickets/data/repository/ticket_repository_impl.dart';
import 'package:tickets_app/tickets/domain/entity/offer.dart';
import 'package:tickets_app/tickets/domain/repository/offer_repository.dart';
import 'package:tickets_app/tickets/domain/repository/ticket_offer_repository.dart';
import 'package:tickets_app/tickets/domain/usecase/load_home_screen.dart';
import 'common/colors.dart';
import 'tickets/presentation/screens.dart';

import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:tickets_app/tickets/data/dto/offer/offer_dto.dart';
import 'package:tickets_app/tickets/data/source/network/service/api_client.dart';

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

  void _getOffers() async {
    final dio = Dio(BaseOptions(contentType: "application/json"));
    final client = ApiClient(dio);
    // final result = await dio.get("https://run.mocky.io/v3/7e55bf02-89ff-4847-9eb7-7d83ef884017");
    // final OfferRepositoryImpl offerRepository = OfferRepositoryImpl(client: client);
    // final ticketOfferRepository = OfferRepositoryImpl(client: client);
    // final result = await ticketOfferRepository.getOffers();

    final OfferRepository repository = OfferRepositoryImpl(client: client);
    // final result = await repository.getOffers();
    final loadHomeScreen = LoadHomeScreenUseCase(repository: repository);
    final result = await loadHomeScreen();

    print(result);

    final offerDtoResult = await client.getOffers();
    final ticketOfferDtoResult = await client.getTicketOffers();
    final ticketDtoResult = await client.getTickets();
    // print(ticketDtoResult);
    // print(offerDtoResult);
    // print(ticketOfferDtoResult);
    // print(offerDtoResult['offers']?[0]);
    // print(ticketOfferDtoResult['tickets_offers']?[0]);
    // print(ticketDtoResult['tickets']?[1]);

  }

  @override
  void initState() {
    // TODO: implement initState
    _getOffers();
    super.initState();
  }

  final List<Widget> _widgets = <Widget>[
    const HomeScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
