// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_pp/core/entities/movie_entity.dart';
import 'package:movies_pp/features/search_view/domain/use_cases/fetch_searched_movies_use_case.dart';

part 'fetch_searched_movies_state.dart';

class FetchSearchedMoviesCubit extends Cubit<FetchSearchedMoviesState> {
  final FetchSearchedMoviesUseCase fetchSearchedMoviesUseCase;
  FetchSearchedMoviesCubit({required this.fetchSearchedMoviesUseCase})
      : super(FetchSearchedMoviesInitialState());
  Future<void> fetchSearchedMovies({required String movieName}) async {
    emit(
      FetchSearchedMoviesLoadingState(),
    );

    var result = await fetchSearchedMoviesUseCase.call(movieName: movieName);
    result.fold(
      (failure) => emit(
        FetchSearchedMoviesErrorState(errorMessage: failure.errorMessage),
      ),
      (movies) => emit(
        FetchSearchedMoviesLoadedState(movies: movies),
      ),
    );
  }
}
