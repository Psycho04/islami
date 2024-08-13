import 'package:flutter/material.dart';

class VersesStyle extends StatelessWidget {
  final int index;
  final String verses;
  const VersesStyle({super.key, required this.index, required this.verses});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        '$verses {${index + 1}}',
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
