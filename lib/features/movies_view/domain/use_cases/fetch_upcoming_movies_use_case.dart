import 'package:dartz/dartz.dart';
import 'package:movies_pp/core/entities/movie_entity.dart';
import 'package:movies_pp/core/errors/failure.dart';
import 'package:movies_pp/core/use_case/use_case.dart';
import 'package:movies_pp/features/movies_view/domain/repositories/movies_repo.dart';

class FetchUpcomingMoviesUseCase extends UseCase<List<MovieEntity>> {
  final MoviesRepo moviesRepo;

  FetchUpcomingMoviesUseCase({required this.moviesRepo});
  @override
  Future<Either<Failure, List<MovieEntity>>> call() async {
    return await moviesRepo.fetchUpcomingMovies();
  }
}
