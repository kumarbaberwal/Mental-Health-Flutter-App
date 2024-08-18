import 'package:flutter/material.dart';

class FeelingButton extends StatelessWidget {
  final String feeling;
  final String imagePath;
  final Color color;
  final VoidCallback onTap;
  const FeelingButton(
      {super.key,
      required this.imagePath,
      required this.color,
      required this.feeling, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
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
      ),
    );
  }
}
