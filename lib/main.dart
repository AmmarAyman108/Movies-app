import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movies_pp/core/api/endpoint.dart';
import 'package:movies_pp/core/color.dart';
import 'package:movies_pp/core/entities/movie_entity.dart';
import 'package:movies_pp/core/locator.dart';
import 'package:movies_pp/core/observer.dart';
import 'package:movies_pp/movies_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  setup();
  await initializedHive();
  setSystemUIOverlayStyle();
  Bloc.observer = SimpleObserver();
  runApp(const MoviesApp());
}

void setSystemUIOverlayStyle() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: ColorManager.kBackgroundColor,
    systemNavigationBarColor: ColorManager.kBackgroundColor,
  ));
}

Future<void> initializedHive() async {
  
  Hive.registerAdapter<MovieEntity>(MovieEntityAdapter());
  await Hive.openBox<MovieEntity>(Endpoints.kPopularMoviesBox);
  await Hive.openBox<MovieEntity>(Endpoints.kTopRatedMoviesBox);
  await Hive.openBox<MovieEntity>(Endpoints.kTrendingOfWeekMoviesBox);
  await Hive.openBox<MovieEntity>(Endpoints.kUpcomingMoviesBox);
}
