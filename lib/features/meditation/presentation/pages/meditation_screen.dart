import 'package:babybrain/core/theme.dart';
import 'package:babybrain/features/meditation/presentation/widgets/feeling_button.dart';
import 'package:babybrain/features/meditation/presentation/widgets/task_card.dart';
import 'package:flutter/material.dart';

class MeditationScreen extends StatelessWidget {
  const MeditationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Image.asset('assets/menu_burger.png'),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage('assets/profile.png'),
          ),
          SizedBox(
            width: 16,
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back, Kumar!',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                'How are you feeling today?',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 16,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FeelingButton(
                    imagePath: "assets/happy.png",
                    color: DefaultColors.pink,
                    feeling: 'Happy',
                  ),
                  FeelingButton(
                    imagePath: "assets/calm.png",
                    color: DefaultColors.purple,
                    feeling: 'Calm',
                  ),
                  FeelingButton(
                    imagePath: "assets/relax.png",
                    color: DefaultColors.orange,
                    feeling: 'Relax',
                  ),
                  FeelingButton(
                    imagePath: "assets/focus.png",
                    color: DefaultColors.lightteal,
                    feeling: 'Focus',
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Today's Task",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 16,
              ),
              TaskCard(
                color: DefaultColors.task1,
                title: 'Morning',
                description: "Let's start the day with a smile",
              ),
              const SizedBox(
                height: 16,
              ),
              TaskCard(
                color: DefaultColors.task2,
                title: 'Noon',
                description: "Let's start the day with a smile",
              ),
              const SizedBox(
                height: 16,
              ),
              TaskCard(
                color: DefaultColors.task3,
                title: 'Evening',
                description: "Let's start the day with a smile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
