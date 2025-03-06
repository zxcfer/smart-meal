import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ToggleThemeEvent extends ThemeEvent {}

// States
abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class ThemeInitial extends ThemeState {
  final bool isDarkMode;

  const ThemeInitial({this.isDarkMode = false});

  @override
  List<Object> get props => [isDarkMode];
}

// Bloc
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeInitial()) {
    on<ToggleThemeEvent>((event, emit) {
      final currentState = state as ThemeInitial;
      emit(ThemeInitial(isDarkMode: !currentState.isDarkMode));
    });
  }
}
