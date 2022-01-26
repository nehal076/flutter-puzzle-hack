import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roll_the_ball/screens/puzzle/bloc/puzzle_bloc.dart';
import 'package:roll_the_ball/screens/puzzle/puzzle_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => PuzzleBloc(),
            child: const PuzzleScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => PuzzleBloc(),
            child: const PuzzleScreen(),
          ),
        );
    }
  }
}
