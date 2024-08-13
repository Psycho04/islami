import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  double turns = 0;
  int counter = 1;
  int azkarIndex = 0;
  final List<String> azkar = ['سبحان الله', 'الحمد لله', 'الله أكبر'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          children: [
            Stack(
              children: [
                const Positioned(
                    top: 0,
                    left: 107,
                    child: ImageIcon(
                        AssetImage('assets/images/head of seb7a.png'),
                        size: 90)),
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        turns += 0.035;
                        counter++;
                        if (counter > 33) {
                          counter = 1;
                          azkarIndex = (azkarIndex + 1) % 3;
                        }
                      });
                    },
                    child: AnimatedRotation(
                      duration: const Duration(seconds: 1),
                      turns: turns,
                      child: const ImageIcon(
                        AssetImage('assets/images/body of seb7a.png'),
                        size: 240)
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(AppLocalizations.of(context)!.numberOfTasbeehs,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontFamily: 'ElMessiri')),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 69,
              height: 81,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary ,
                  borderRadius: BorderRadius.circular(25)),
              child: Center(
                  child: Text('$counter',
                      style: Theme.of(context).textTheme.bodySmall)),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    turns += 0.035;
                    counter++;
                    if (counter > 33) {
                      counter = 1;
                      azkarIndex = (azkarIndex + 1) % 3;
                    }
                  });
                },
                child: Text(azkar[azkarIndex],
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall))
          ],
        ),
      ),
    );
  }
}
