import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_pp/core/entities/movie_entity.dart';
import 'package:movies_pp/core/errors/failure.dart';
import 'package:movies_pp/features/movies_view/data/data_sources/local_data_source.dart';
import 'package:movies_pp/features/movies_view/data/data_sources/remote_data_source.dart';
import 'package:movies_pp/features/movies_view/domain/repositories/movies_repo.dart';

class MoviesRepoImpl extends MoviesRepo {
  final MoviesLocalDataSource moviesLocalDataSource;
  final MoviesRemoteDataSource moviesRemoteDataSource;

  MoviesRepoImpl(
      {required this.moviesLocalDataSource,
      required this.moviesRemoteDataSource});
  @override
  Future<Either<Failure, List<MovieEntity>>> fetchPopularMovies() async {
    try {
      List<MovieEntity> movies;
      movies = moviesLocalDataSource.fetchPopularMovies();
      if (movies.isNotEmpty) {
        return right(movies);
      }
      movies = await moviesRemoteDataSource.fetchPopularMovies();
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> fetchTopRatedMovies() async {
    try {
      List<MovieEntity> movies;
      movies = moviesLocalDataSource.fetchTopRatedMovies();
      if (movies.isNotEmpty) {
        return right(movies);
      }
      movies = await moviesRemoteDataSource.fetchTopRatedMovies();
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> fetchTrendingOfWeekMovies() async {
    try {                     
      List<MovieEntity> movies;
      movies = moviesLocalDataSource.fetchTrendingOfWeekMovies();
      if (movies.isNotEmpty) {
        return right(movies);
      }
      movies = await moviesRemoteDataSource.fetchTrendingOfWeekMovies();
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> fetchUpcomingMovies() async {
    try {
      List<MovieEntity> movies;
      movies = moviesLocalDataSource.fetchUpcomingMovies();
      if (movies.isNotEmpty) {
        return right(movies);
      }
      movies = await moviesRemoteDataSource.fetchUpcomingMovies();
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
