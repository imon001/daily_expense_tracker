import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({super.key, required this.fill});
  final double fill;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: FractionallySizedBox(
          heightFactor: fill,
          child: DecoratedBox(
              decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(5)),
            color: Theme.of(context).colorScheme.primary,
          )),
        ),
      ),
    );
  }
}
