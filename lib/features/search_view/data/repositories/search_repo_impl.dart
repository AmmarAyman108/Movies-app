import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_pp/core/entities/movie_entity.dart';
import 'package:movies_pp/core/errors/failure.dart';
import 'package:movies_pp/features/search_view/data/data_sources/remote_data_source.dart';
import 'package:movies_pp/features/search_view/domain/repositories/search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepoImpl({required this.searchRemoteDataSource});

  @override
  Future<Either<Failure, List<MovieEntity>>> fetchSearchedMovies({required String movieName}) async {
    try {
      List<MovieEntity> movies;

      movies = await searchRemoteDataSource.fetchSearchedMovies(movieName: movieName);
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
