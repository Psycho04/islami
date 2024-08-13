import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/screens/hadeth/hadeth_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethScreen extends StatefulWidget {
  const HadethScreen({super.key});

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<HadethModel> ahadeth = [];

  @override
  void initState() {
    super.initState();
    loadFile();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image.asset('assets/images/hadeth_logo.png'),
        ),
        const SizedBox(
          height: 20,
        ),
        const Divider(),
        Text(
          AppLocalizations.of(context)!.hadith,
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(fontFamily: 'ElMessiri'),
        ),
        const Divider(),
        Expanded(
          child: ahadeth.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: ahadeth.length,
                  itemBuilder: (BuildContext context, int index) {
                    return hadethTitle(ahadeth[index]);
                  },
                ),
        ),
      ],
    );
  }

  loadFile() async {
    String content = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> ahadethRaw = content.split('#');
    for (var i = 0; i < ahadethRaw.length; i++) {
      List<String> hadethContent = ahadethRaw[i].trim().split('\n');
      String hadethTitle = hadethContent[0];
      hadethContent.removeAt(0);
      String hadethText = hadethContent.join('\n');
      ahadeth.add(HadethModel(title: hadethTitle, content: hadethText));
    }
    setState(() {});
  }
}

class HadethModel {
  String title;
  String content;
  HadethModel({required this.title, required this.content});
}
