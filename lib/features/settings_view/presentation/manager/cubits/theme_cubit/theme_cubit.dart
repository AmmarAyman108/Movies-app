import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movies_pp/core/constant.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  bool isDark = false;

  Box box = Hive.box<String>(Settings.themeBox);

  ThemeCubit() : super(SystemTheme(themeMode: ThemeMode.system));

  void loadTheme() async {
    String theme =
        box.get(Settings.themeKey, defaultValue: Settings.systemValue);
    switch (theme) {
      case 'light':
        emit(LightTheme(themeMode: ThemeMode.light));
      case 'dark':
        emit(DarkTheme(themeMode: ThemeMode.dark));
      default:
        emit(SystemTheme(themeMode: ThemeMode.system));
    }
  }

  void changeTheme(ThemeMode themeMode) async {
    if (themeMode == ThemeMode.light) {
      isDark = false;
      await box.put(Settings.themeKey, Settings.lightValue);
      emit(LightTheme(themeMode: ThemeMode.light));
    } else if (themeMode == ThemeMode.dark) {
      isDark = true;
      await box.put(Settings.themeKey, Settings.darkValue);
      emit(DarkTheme(themeMode: ThemeMode.dark));
    } else {
      await box.put(Settings.themeKey, Settings.systemValue);
      emit(SystemTheme(themeMode: ThemeMode.system));
    }
  }
}
