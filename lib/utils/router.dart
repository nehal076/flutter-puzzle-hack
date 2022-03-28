import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:way_for_ball/screens/puzzle/blocs/ball/ball_bloc.dart';
import 'package:way_for_ball/screens/puzzle/blocs/puzzle/puzzle_bloc.dart';
import 'package:way_for_ball/screens/puzzle/blocs/timer/timer_bloc.dart';
import 'package:way_for_ball/screens/puzzle/puzzle_screen.dart';
import 'package:way_for_ball/screens/start/bloc/bird_bloc.dart';
import 'package:way_for_ball/screens/start/start_screen.dart';
import 'package:way_for_ball/utils/screens.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => PuzzleBloc(),
              ),
              BlocProvider(
                create: (context) => BallBloc(),
              ),
              BlocProvider(
                create: (context) => BirdBloc(),
              ),
            ],
            child: const StartScreen(),
          ),
          settings: settings,
        );
      case Screens.puzzle_screen:
        int? level = settings.arguments as int?;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => PuzzleBloc(),
              ),
              BlocProvider(
                create: (context) => BallBloc(),
              ),
              BlocProvider(
                create: (context) => TimerBloc(),
              ),
            ],
            child: PuzzleScreen(level: level),
          ),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => PuzzleBloc(),
              ),
              BlocProvider(
                create: (context) => BallBloc(),
              ),
              BlocProvider(
                create: (context) => BirdBloc(),
              ),
            ],
            child: const StartScreen(),
          ),
          settings: settings,
        );
    }
  }
}
