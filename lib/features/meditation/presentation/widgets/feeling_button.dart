import 'package:flutter/material.dart';

class FeelingButton extends StatelessWidget {
  final String feeling;
  final String imagePath;
  final Color color;
  const FeelingButton(
      {super.key,
      required this.imagePath,
      required this.color,
      required this.feeling});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset(
            imagePath,
            height: 25,
          ),
        ),
        Text(
          feeling,
          style: Theme.of(context).textTheme.labelSmall,
        )
      ],
    );
  }
}
