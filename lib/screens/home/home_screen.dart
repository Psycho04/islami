import 'package:flutter/material.dart';
import 'package:islamic/Providers/theme_provider.dart';
import 'package:islamic/screens/hadeth/hadeth_screen.dart';
import 'package:islamic/screens/home/bottmo_nav_bar.dart';
import 'package:islamic/screens/quran/quran_screen.dart';
import 'package:islamic/screens/radio/radio_screen.dart';
import 'package:islamic/screens/sebha/sebha_screen.dart';
import 'package:islamic/screens/settings/settings_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ThemeProvider themeProvider;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                themeProvider.isDark
                    ? 'assets/images/main_dark_bg.png'
                    : 'assets/images/main_bg.png',
              )
              )
          ),
        ),
        Scaffold(
          appBar: AppBar(
            title:  Text(AppLocalizations.of(context)!.islamy),
          ),
          body: screens[selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            currentIndex: selectedIndex,
            items: [
              BottomNavBar(AppLocalizations.of(context)!.quran, 'assets/images/icon_quran.png',
                  Theme.of(context).colorScheme.primary),
              BottomNavBar(AppLocalizations.of(context)!.hadith, 'assets/images/icon_hadeth.png',
                  Theme.of(context).colorScheme.primary),
              BottomNavBar(AppLocalizations.of(context)!.tasbeeh, 'assets/images/icon_sebha.png',
                  Theme.of(context).colorScheme.primary),
              BottomNavBar(AppLocalizations.of(context)!.radio, 'assets/images/icon_radio.png',
                  Theme.of(context).colorScheme.primary),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.settings,
                  backgroundColor: Theme.of(context).colorScheme.primary),
            ],
          ),
        )
      ],
    );
  }

  var screens = [
    const QuranScreen(),
    const HadethScreen(),
    const SebhaScreen(),
    const RadioScreen(),
    const SettingsScreen(),
  ];
}
