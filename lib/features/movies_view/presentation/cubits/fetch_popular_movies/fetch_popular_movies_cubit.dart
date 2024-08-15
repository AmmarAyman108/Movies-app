// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_pp/core/entities/movie_entity.dart';
import 'package:movies_pp/features/movies_view/domain/use_cases/fetch_popular_movies_use_case.dart';

part 'fetch_popular_movies_state.dart';

class FetchPopularMoviesCubit extends Cubit<FetchPopularMoviesState> {
  final FetchPopularMoviesUseCase fetchPopularMoviesUseCase;
  FetchPopularMoviesCubit({required this.fetchPopularMoviesUseCase})
      : super(FetchPopularMoviesInitialState());
  Future<void> fetchPopularMovies() async {
    emit(
      FetchPopularMoviesLoadingState(),
    );

    var result = await fetchPopularMoviesUseCase.call();
    result.fold(
      (failure) => emit(
        FetchPopularMoviesErrorState(errorMessage: failure.errorMessage),
      ),
      (movies) => emit(
        FetchPopularMoviesLoadedState(movies: movies),
      ),
    );
  }
}
