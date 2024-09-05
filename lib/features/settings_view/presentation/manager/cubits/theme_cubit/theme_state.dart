part of 'theme_cubit.dart';

@immutable
sealed class ThemeState {
  ThemeMode themeMode;
  ThemeState({required this.themeMode});
}

final class LightTheme extends ThemeState {
  LightTheme({required super.themeMode});
}

final class DarkTheme extends ThemeState {
  DarkTheme({required super.themeMode});
}

final class SystemTheme extends ThemeState {
  SystemTheme({required super.themeMode});
}
