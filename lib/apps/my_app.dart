import 'package:babybrain/core/theme.dart';
import 'package:babybrain/features/music/data/datasources/song_remote_datasource.dart';
import 'package:babybrain/features/music/data/repository/song_repository_impl.dart';
import 'package:babybrain/features/music/domain/usecase/get_all_songs.dart';
import 'package:babybrain/features/music/presentation/bloc/song_bloc.dart';
import 'package:babybrain/features/music/presentation/bloc/song_event.dart';
import 'package:babybrain/presentation/bottomNavBar/bloc/navigation_bloc.dart';
import 'package:babybrain/presentation/homePage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationBloc(),
        ),
        BlocProvider(
          create: (context) => SongBloc(
            getAllSongs: GetAllSongs(
              repository: SongRepositoryImpl(
                remoteDataSource:
                    SongRemoteDatasourceImpl(client: http.Client()),
              ),
            ),
          )..add(FetchSongs()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: HomePage(),
      ),
    );
  }
}
