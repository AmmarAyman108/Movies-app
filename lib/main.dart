import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movies_pp/core/color.dart';
import 'package:movies_pp/core/constants.dart';
import 'package:movies_pp/core/entities/movie_entity.dart';
import 'package:movies_pp/core/locator.dart';
import 'package:movies_pp/core/observer.dart';
import 'package:movies_pp/movies_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
   setup();
  Hive.registerAdapter<MovieEntity>(MovieEntityAdapter());
  await Hive.openBox<MovieEntity>(Settings.kPopularMoviesBox);
  await Hive.openBox<MovieEntity>(Settings.kTopRatedMoviesBox);
  await Hive.openBox<MovieEntity>(Settings.kTrendingOfWeekMoviesBox);
  await Hive.openBox<MovieEntity>(Settings.kUpcomingMoviesBox);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: ColorManager.kBackgroundColor,
    systemNavigationBarColor: ColorManager.kBackgroundColor,
  ));
  Bloc.observer = SimpleObserver();

  runApp(const MoviesApp());
}
