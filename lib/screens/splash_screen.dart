import 'package:flutter/material.dart';
import 'package:islamic/Providers/theme_provider.dart';
import 'package:islamic/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash';
  SplashScreen({super.key});
  late ThemeProvider themeProvider;



  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    Future.delayed(const Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, HomeScreen.routeName));
    return Scaffold(
      body: Image.asset(
        themeProvider.isDark
            ? 'assets/images/splash_dark.png'
            : 'assets/images/splash.png',
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
