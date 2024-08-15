// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_pp/core/entities/movie_entity.dart';
import 'package:movies_pp/features/movies_view/domain/use_cases/fetch_top_rated_movies_use_case.dart';

part 'fetch_top_rated_movies_state.dart';

class FetchTopRatedMoviesCubit extends Cubit<FetchTopRatedMoviesState> {
  final FetchTopRatedMoviesUseCase fetchTopRatedMoviesUseCase;
  FetchTopRatedMoviesCubit({required this.fetchTopRatedMoviesUseCase})
      : super(FetchTopRatedMoviesInitialState());

  Future<void> fetchTopRatedMovies() async {
    emit(
      FetchTopRatedMoviesLoadingState(),
    );

    var result = await fetchTopRatedMoviesUseCase.call();

    result.fold(
      (failure) => emit(
        FetchTopRatedMoviesErrorState(errorMessage: failure.errorMessage),
      ),
      (movies) => emit(
        FetchTopRatedMoviesLoadedState(movies: movies),
      ),
    );
  }
}
