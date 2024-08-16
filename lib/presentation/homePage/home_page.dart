import 'package:babybrain/features/meditation/presentation/pages/meditation_screen.dart';
import 'package:babybrain/features/music/presentation/pages/playlist_screen.dart';
import 'package:babybrain/presentation/bottomNavBar/bloc/navigation_bloc.dart';
import 'package:babybrain/presentation/bottomNavBar/bloc/navigation_state.dart';
import 'package:babybrain/presentation/bottomNavBar/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final List<Widget> pages = [
    const MeditationScreen(),
    // const MusicPlayerScreen(),
    PlaylistScreen(),
  ];

  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          debugPrint(state.toString());
          if (state is NavigationChanged) {
            return pages[state.index];
          }
          return pages[0];
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          int currentIndex = 0;
          if (state is NavigationChanged) {
            currentIndex = state.index;
          }
          final List<BottomNavigationBarItem> bottomNavItems = [
            createBottomNavBarItem(
              assetName: 'assets/menu_home.png',
              isActive: currentIndex == 0,
              context: context,
            ),
            createBottomNavBarItem(
              assetName: 'assets/menu_songs.png',
              isActive: currentIndex == 1,
              context: context,
            ),
          ];
          return BottomNavBar(
            currentIndex: currentIndex,
            items: bottomNavItems,
          );
        },
      ),
    );
  }

  BottomNavigationBarItem createBottomNavBarItem(
      {required String assetName,
      required bool isActive,
      required BuildContext context}) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        assetName,
        color: isActive
            ? Theme.of(context).focusColor
            : Theme.of(context).primaryColor,
        height: 45,
      ),
      label: '',
    );
  }
}
