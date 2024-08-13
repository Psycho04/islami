import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/Providers/language_provider.dart';
import 'package:islamic/Providers/theme_provider.dart';
import 'package:islamic/themes/light_theme.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late LanguageProvider languageProvider ;
  late ThemeProvider themeProvider;


  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of(context);
    themeProvider = Provider.of(context);
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 10,
          ),
          DropdownButton(
            elevation: 20,
            borderRadius: BorderRadius.circular(30),
            dropdownColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(
              Icons.language,
              color: MyLightTheme.lightPrimaryColor,
            ),
            isExpanded: true,
            value: languageProvider.lang,
            items: [
              DropdownMenuItem(
                  value: 'ar',
                  child: Text(
                    'العربية',
                    style: Theme.of(context).textTheme.displayMedium,
                  )),
              DropdownMenuItem(
                  value: 'en',
                  child: Text(
                    'English',
                    style: Theme.of(context).textTheme.displayMedium,
                  )),
            ],
            onChanged: (value) {
              languageProvider.newLang = value!;
              setState(() {});
            },
          ),
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.theme,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Switch(
                value: themeProvider.isDark,
                onChanged: (value) {
                  themeProvider.newTheme = value
                      ? ThemeMode.dark
                      : ThemeMode.light;
                  setState(() {});
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
