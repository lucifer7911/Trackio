import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({super.key, required this.fill});

  final double fill;

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: FractionallySizedBox(
        heightFactor: fill,
        alignment: Alignment.bottomCenter,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: isDarkMode
                ? Colors.teal.shade200
                : Theme.of(context).colorScheme.primary.withOpacity(0.7),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          ),
        ),
      ),
    );
  }
}
