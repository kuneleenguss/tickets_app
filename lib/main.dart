import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tickets_app/common/typography.dart';
import 'common/icons.dart' as AssetIcons;
import 'common/colors.dart';
import 'tickets/presentation/screens.dart';

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
  
  final List<Widget> _widgets = <Widget>[
    const HomeScreen(),
    SearchScreen(),
  ];

  void _onItemTapped (int index) {
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
                child: Center(child: SvgPicture.asset(
                  fit: BoxFit.none,
                  "assets/icons/ic_plane.svg", color: BasicColors.grey6))),
              activeIcon: SizedBox(
                width: 24,
                height: 24,
                child: Center(child: SvgPicture.asset(
                  fit: BoxFit.none,
                  "assets/icons/ic_plane.svg", color: SpecialColors.blue))),
              label: "Авиабилеты"
              ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 24,
                height: 24,
                child: Center(child: SvgPicture.asset(
                  fit: BoxFit.none,
                  "assets/icons/ic_hotel.svg", color: BasicColors.grey6))),
              activeIcon: SvgPicture.asset("assets/icons/ic_hotel.svg", color: SpecialColors.blue),
              label: "Отели"
              ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 24,
                height: 24,
                child: Center(child: SvgPicture.asset(
                  fit: BoxFit.none,
                  "assets/icons/ic_location.svg", color: BasicColors.grey6))),
              activeIcon: SvgPicture.asset("assets/icons/ic_location.svg", color: SpecialColors.blue),
              label: "Короче"
              ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 24,
                height: 24,
                child: Center(child: SvgPicture.asset(
                  fit: BoxFit.none,
                  "assets/icons/ic_alert.svg", color: BasicColors.grey6))),
              activeIcon: SvgPicture.asset("assets/icons/ic_alert.svg", color: SpecialColors.blue),
              label: "Подписки"
              ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 24,
                height: 24,
                child: Center(child: SvgPicture.asset(
                  fit: BoxFit.none,
                  "assets/icons/ic_profile.svg", color: BasicColors.grey6))),
              activeIcon: SvgPicture.asset("assets/icons/ic_profile.svg", color: SpecialColors.blue),
              label: "Профиль"
              ),
          ],
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          ),
        ),
        
      body: _widgets[1],
    );
  }
}

