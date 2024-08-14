import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islamic/Providers/language_provider.dart';
import 'package:islamic/Providers/theme_provider.dart';
import 'package:islamic/screens/hadeth/hadeth_content.dart';
import 'package:islamic/screens/home/home_screen.dart';
import 'package:islamic/screens/quran/sura_content.dart';
import 'package:islamic/screens/splash_screen.dart';
import 'package:islamic/themes/dark_theme.dart';
import 'package:islamic/themes/light_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
        child: const MyApp()),
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageProvider languageProvider = Provider.of(context);
    ThemeProvider themeprovider = Provider.of(context);
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      locale: Locale(languageProvider.lang),
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (context) =>  SplashScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        SuraContent.routeName: (context) => const SuraContent(),
        HadethContent.routeName: (context) =>  HadethContent(),
      },
      initialRoute: 'splash',
      theme: MyLightTheme.lightTheme,
      darkTheme: myDarkTheme.darkTheme,
      themeMode: themeprovider.currentTheme,
    );
  }
}
