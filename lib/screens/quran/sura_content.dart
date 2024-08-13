import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/Providers/theme_provider.dart';
import 'package:islamic/screens/quran/verses_style.dart';
import 'package:provider/provider.dart';

class SuraContent extends StatefulWidget {
  static const String routeName = 'SuraContent';
  const SuraContent({super.key});

  @override
  State<SuraContent> createState() => _SuraContentState();
}

class _SuraContentState extends State<SuraContent> {
  late ThemeProvider themeProvider;
  List<String> verses = [];
  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    SuraContentArg args =
        ModalRoute.of(context)!.settings.arguments as SuraContentArg;

    readFileData(args.index);

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
            title: const Text('إسلامي'),
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
                          'سورة ${args.suraName}',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontFamily: 'inter'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(
                          Icons.play_circle,
                          color: Colors.black,
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Divider(),
                    ),
                    verses.isNotEmpty
                        ? Expanded(
                            child: ListView.builder(
                                itemCount: verses.length,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return VersesStyle(verses: verses[index], index: index,);
                                }),
                          )
                        : const CircularProgressIndicator()
                  ],
                ),
              ),
            ),
          )),
    );
  }

  void readFileData(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> verses = content.trim().split('\n');
    setState(() {
      this.verses = verses;
    });
  }
}

class SuraContentArg {
  String suraName;
  int index;
  SuraContentArg({required this.suraName, required this.index});
}