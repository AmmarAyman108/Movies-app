import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_pp/core/color.dart';

class AppTheme {
  static ThemeData get() {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: ColorManager.kBackgroundColor,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.kBackgroundColor,
          systemNavigationBarColor: ColorManager.kBackgroundColor,
        ),
      ),
    );
  }
}
