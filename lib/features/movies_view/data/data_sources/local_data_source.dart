import 'package:hive/hive.dart';
import 'package:movies_pp/core/constants.dart';
import 'package:movies_pp/core/entities/movie_entity.dart';

abstract class MoviesLocalDataSource {
  List<MovieEntity> fetchPopularMovies();
  List<MovieEntity> fetchUpcomingMovies();
  List<MovieEntity> fetchTopRatedMovies();
  List<MovieEntity> fetchTrendingOfWeekMovies();
}

class MoviesLocalDataSourceImpl extends MoviesLocalDataSource {
  @override
  List<MovieEntity> fetchPopularMovies() {
    return Hive.box<MovieEntity>(Settings.kPopularMoviesBox).values.toList();
  }

  @override
  List<MovieEntity> fetchTopRatedMovies() {
    return Hive.box<MovieEntity>(Settings.kTopRatedMoviesBox).values.toList();
  }

  @override
  List<MovieEntity> fetchTrendingOfWeekMovies() {
    return Hive.box<MovieEntity>(Settings.kTrendingOfWeekMoviesBox)
        .values
        .toList();
  }

  @override
  List<MovieEntity> fetchUpcomingMovies() {
    return Hive.box<MovieEntity>(Settings.kUpcomingMoviesBox).values.toList();
  }
}
