import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movies_pp/core/color.dart';
import 'package:movies_pp/core/constant.dart';
import 'package:movies_pp/core/entities/movie_entity.dart';
import 'package:movies_pp/core/locator.dart';
import 'package:movies_pp/core/observer.dart';
import 'package:movies_pp/movies_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await initializedHiveRegisterAdapter();
  await createdHiveBoxes();
  setSystemUIOverlayStyle();
  initializedObserver();
  runApp(const MoviesApp());
}

void initializedObserver() {
  Bloc.observer = SimpleObserver();
}

void setSystemUIOverlayStyle() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: ColorManager.kBackgroundColor,
    systemNavigationBarColor: ColorManager.kBackgroundColor,
  ));
}

Future<void> initializedHiveRegisterAdapter() async {
  await Hive.initFlutter();
  Hive.registerAdapter<MovieEntity>(MovieEntityAdapter());
  await createdHiveBoxes();
}

Future<void> createdHiveBoxes() async {
  await Future.wait([
    Hive.openBox<String>(Settings.themeBox),
    Hive.openBox<MovieEntity>(Settings.kPopularMoviesBox),
    Hive.openBox<MovieEntity>(Settings.kTopRatedMoviesBox),
    Hive.openBox<MovieEntity>(Settings.kTrendingOfWeekMoviesBox),
    Hive.openBox<MovieEntity>(Settings.kUpcomingMoviesBox),
  ]);
}
