import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:haoyako/core/theme/theme_data.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(LightThemeState());

  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ToggleThemeEvent) {
      if (state is LightThemeState) {
        yield DarkThemeState();
      } else {
        yield LightThemeState();
      }
    }
  }
}
