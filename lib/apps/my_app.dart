import 'package:babybrain/core/theme.dart';
import 'package:babybrain/features/meditation/data/datasources/meditation_remote_datasource.dart';
import 'package:babybrain/features/meditation/data/repositories/meditaion_repository_impl.dart';
import 'package:babybrain/features/meditation/domain/usecases/get_daily_quote.dart';
import 'package:babybrain/features/meditation/domain/usecases/get_mood_message.dart';
import 'package:babybrain/features/meditation/presentation/bloc/daily_quote/daily_quote_bloc.dart';
import 'package:babybrain/features/meditation/presentation/bloc/daily_quote/daily_quote_event.dart';
import 'package:babybrain/features/meditation/presentation/bloc/mood_message/mood_message_bloc.dart';
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
        BlocProvider(
          create: (context) => DailyQuoteBloc(
            getDailyQuote: GetDailyQuote(
              repository: MeditaionRepositoryImpl(
                remoteDatasource: MeditationRemoteDatasourceImpl(
                  client: http.Client(),
                ),
              ),
            ),
          )..add(FetchDailyQuote()),
        ),
        BlocProvider(
          create: (context) => MoodMessageBloc(
            getMoodMessage: GetMoodMessage(
              repository: MeditaionRepositoryImpl(
                remoteDatasource: MeditationRemoteDatasourceImpl(
                  client: http.Client(),
                ),
              ),
            ),
          ),
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
