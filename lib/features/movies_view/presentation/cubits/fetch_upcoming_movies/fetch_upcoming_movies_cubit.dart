import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_pp/core/entities/movie_entity.dart';
import 'package:movies_pp/features/movies_view/domain/use_cases/fetch_upcoming_movies_use_case.dart';

part 'fetch_upcoming_movies_state.dart';

class FetchUpcomingMoviesCubit extends Cubit<FetchUpcomingMoviesState> {
  final FetchUpcomingMoviesUseCase fetchUpcomingMoviesUseCase;
  FetchUpcomingMoviesCubit({required this.fetchUpcomingMoviesUseCase})
      : super(FetchUpcomingMoviesInitialState());

  Future<void> fetchUpcomingMovies() async {
    emit(
      FetchUpcomingMoviesLoadingState(),
    );

    var result = await fetchUpcomingMoviesUseCase.call();
    result.fold(
      (failure) => emit(
        FetchUpcomingMoviesErrorState(errorMessage: failure.errorMessage),
      ),
      (movies) => emit(
        FetchUpcomingMoviesLoadedState(movies: movies),
      ),
    );
  }
}
