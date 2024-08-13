import 'package:flutter/material.dart';
import 'package:islamic/screens/hadeth/hadeth_screen.dart';

// ignore: must_be_immutable, camel_case_types
class hadethTitle extends StatelessWidget {
  HadethModel hadeth;
  hadethTitle(this.hadeth, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'HadethContent', arguments: hadeth);
      },
      child: Text(
        hadeth.title,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(fontFamily: 'inter'),
      ),
    );
  }
}
