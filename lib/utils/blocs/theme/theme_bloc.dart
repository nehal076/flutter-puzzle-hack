import 'package:bloc/bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ToggleTheme>(_toggleTheme);
  }

  _toggleTheme(ToggleTheme event, Emitter<ThemeState> emit) {
    if (state is ThemeWood) {
      emit(ThemeSpace());
    } else {
      emit(ThemeWood());
    }
  }
}
