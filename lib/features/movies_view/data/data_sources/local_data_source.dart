import 'package:hive/hive.dart';
import 'package:movies_pp/core/api/endpoint.dart';
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
    return Hive.box<MovieEntity>(Endpoints.kPopularMoviesBox).values.toList();
  }

  @override
  List<MovieEntity> fetchTopRatedMovies() {
    return Hive.box<MovieEntity>(Endpoints.kTopRatedMoviesBox).values.toList();
  }

  @override
  List<MovieEntity> fetchTrendingOfWeekMovies() {
    return Hive.box<MovieEntity>(Endpoints.kTrendingOfWeekMoviesBox)
        .values
        .toList();
  }

  @override
  List<MovieEntity> fetchUpcomingMovies() {
    return Hive.box<MovieEntity>(Endpoints.kUpcomingMoviesBox).values.toList();
  }
}
