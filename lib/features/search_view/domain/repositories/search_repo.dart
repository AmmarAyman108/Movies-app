import 'package:dartz/dartz.dart';
import 'package:movies_pp/core/entities/movie_entity.dart';
import 'package:movies_pp/core/errors/failure.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<MovieEntity>>> fetchSearchedMovies({required String movieName});
}
