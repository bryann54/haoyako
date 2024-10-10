part of 'theme_bloc.dart';

abstract class ThemeState {
  final ThemeData themeData;
  const ThemeState(this.themeData);
}

class LightThemeState extends ThemeState {
  LightThemeState() : super(AppTheme.lightTheme);
}

class DarkThemeState extends ThemeState {
  DarkThemeState() : super(AppTheme.darkTheme);
}

