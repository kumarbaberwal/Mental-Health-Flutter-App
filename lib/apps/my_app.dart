import 'package:babybrain/core/theme.dart';
import 'package:babybrain/presentation/bottomNavBar/bloc/navigation_bloc.dart';
import 'package:babybrain/presentation/homePage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: HomePage(),
      ),
    );
  }
}
