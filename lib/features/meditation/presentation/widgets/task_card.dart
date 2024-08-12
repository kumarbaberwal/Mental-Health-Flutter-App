import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final Color color;
  final String title;
  final String description;
  const TaskCard(
      {super.key,
      required this.color,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      description,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(Icons.arrow_forward_ios),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
