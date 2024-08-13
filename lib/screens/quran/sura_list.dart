
import 'package:flutter/material.dart';
import 'package:islamic/screens/quran/sura_content.dart';


class SuraList extends StatelessWidget {
  final String suraName;
  final int versesNumber;
  final int index;

  const SuraList(
      {super.key, required this.suraName, required this.versesNumber, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraContent.routeName,arguments: SuraContentArg(suraName: suraName, index: index));
      },
      child: Row(
        children: [
        Expanded(
            child: Center(
                child: Text(versesNumber.toString(),
                    style: Theme.of(context).textTheme.bodySmall))),
        Container(
          width: 2,
          height: 40,
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        Expanded(
            child: Center(
                child: Text(suraName,
                    style:Theme.of(context).textTheme.bodySmall
                        ))),
      ]),
    );
  }
}
