import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset('assets/images/radio_image.png'),
        ),
        const SizedBox(
          height: 50,
        ),
        Text(
          AppLocalizations.of(context)!.quranRadio,
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(fontFamily: 'ElMessiri'),
        ),
        const SizedBox(
          height: 30,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.skip_previous,
            ),
            SizedBox(
              width: 45,
            ),
            Icon(
              Icons.play_arrow,
              size: 50,
            ),
            SizedBox(
              width: 45,
            ),
            Icon(Icons.skip_next)
          ],
        )
      ],
    );
  }
}
