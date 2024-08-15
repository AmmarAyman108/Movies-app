import 'package:dartz/dartz.dart';
import 'package:movies_pp/core/entities/movie_entity.dart';
import 'package:movies_pp/core/errors/failure.dart';
import 'package:movies_pp/core/use_case/use_case.dart';
import 'package:movies_pp/features/search_view/domain/repositories/search_repo.dart';

class FetchSearchedMoviesUseCase extends UseCase<List<MovieEntity>> {
  final SearchRepo searchRepo;

  FetchSearchedMoviesUseCase({required this.searchRepo});

  @override
  Future<Either<Failure, List<MovieEntity>>> call({String? movieName}) async {
    return await searchRepo.fetchSearchedMovies(movieName: movieName??'');
  }
}
