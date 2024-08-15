import 'package:dartz/dartz.dart';
import 'package:movies_pp/core/entities/movie_entity.dart';
import 'package:movies_pp/core/errors/failure.dart';

abstract class MoviesRepo {
  Future<Either<Failure, List<MovieEntity>>> fetchPopularMovies();
  Future<Either<Failure, List<MovieEntity>>> fetchUpcomingMovies();
  Future<Either<Failure, List<MovieEntity>>> fetchTopRatedMovies();
  Future<Either<Failure, List<MovieEntity>>> fetchTrendingOfWeekMovies();
}
