import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'common/icons.dart' as AssetIcons;
import 'common/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        useMaterial3: true,
      ),
      home: const AppView(title: 'Flutter Demo Home Page'),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  int _selectedIndex = 0;
  
  final List<Widget> _widgets = <Widget>[
    const Placeholder()
  ];

  void _onItemTapped (int index) {
    setState(() {
      });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SizedBox(
          height: 56,
          child: BottomNavigationBar(
            selectedLabelStyle: const TextStyle(fontFamily: "SF Pro Display", fontSize: 10),
            unselectedLabelStyle: const TextStyle(fontFamily: "SF Pro Display", fontSize: 10),
            backgroundColor: BasicColors.black,
            unselectedItemColor: BasicColors.grey6,
            selectedItemColor: SpecialColors.blue,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 24,
                height: 24,
                child: Center(child: SvgPicture.asset("assets/icons/ic_plane.svg", color: BasicColors.grey6))),
              activeIcon: SvgPicture.asset("assets/icons/ic_plane.svg", color: SpecialColors.blue),
              label: "Авиабилеты"
              ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 24,
                height: 24,
                child: Center(child: SvgPicture.asset("assets/icons/ic_hotel.svg", color: BasicColors.grey6))),
              activeIcon: SvgPicture.asset("assets/icons/ic_hotel.svg", color: SpecialColors.blue),
              label: "Отели"
              ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 24,
                height: 24,
                child: Center(child: SvgPicture.asset("assets/icons/ic_location.svg", color: BasicColors.grey6))),
              activeIcon: SvgPicture.asset("assets/icons/ic_location.svg", color: SpecialColors.blue),
              label: "Короче"
              ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 24,
                height: 24,
                child: Center(child: SvgPicture.asset("assets/icons/ic_alert.svg", color: BasicColors.grey6))),
              activeIcon: SvgPicture.asset("assets/icons/ic_alert.svg", color: SpecialColors.blue),
              label: "Подписки"
              ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 24,
                height: 24,
                child: Center(child: SvgPicture.asset("assets/icons/ic_profile.svg", color: BasicColors.grey6))),
              activeIcon: SvgPicture.asset("assets/icons/ic_profile.svg", color: SpecialColors.blue),
              label: "Профиль"
              ),
          ],
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          ),
        ),
        
      body: _widgets[_selectedIndex],
    );
  }
}

