import 'package:flutter/material.dart';
import 'package:islamic/Providers/theme_provider.dart';
import 'package:islamic/screens/hadeth/hadeth_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HadethContent extends StatelessWidget {
  static const String routeName = 'HadethContent';
   HadethContent({super.key});

late ThemeProvider themeProvider;
  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    HadethModel args =
        ModalRoute.of(context)!.settings.arguments as HadethModel;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration:  BoxDecoration(
          image:
              DecorationImage(image: AssetImage(
                themeProvider.isDark
                    ? 'assets/images/main_dark_bg.png'
                    : 'assets/images/main_bg.png',
                ))),
      child: Scaffold(
          appBar: AppBar(
            title:  Text(AppLocalizations.of(context)!.islamy),
            centerTitle: true,
          ),
          body: Center(
            child: SizedBox(
              width: 350,
              height: 650,
              child: Card(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          args.title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontFamily: 'inter'),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Divider(),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            args.content,
                            textAlign: TextAlign.end,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
