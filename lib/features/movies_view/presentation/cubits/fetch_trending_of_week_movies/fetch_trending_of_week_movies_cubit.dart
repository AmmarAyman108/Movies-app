import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:movies_pp/core/entities/movie_entity.dart';
import 'package:movies_pp/features/movies_view/domain/use_cases/fetch_trending_of_week_movies_use_case_.dart';

part 'fetch_trending_of_week_movies_state.dart';

class FetchTrendingOfWeekMoviesCubit
    extends Cubit<FetchTrendingOfWeekMoviesState> {
  final FetchTrendingOfWeekMoviesUseCase fetchTrendingOfWeekMoviesUseCase;
  FetchTrendingOfWeekMoviesCubit({required this.fetchTrendingOfWeekMoviesUseCase})
      : super(FetchTrendingOfWeekMoviesInitialState());

  Future<void> fetchTrendingOfWeekMovies() async {
     emit(
      FetchTrendingOfWeekMoviesLoadingState(),
    );

    var result = await 
      fetchTrendingOfWeekMoviesUseCase.call();
    result.fold(
      (failure) => emit(
        FetchTrendingOfWeekMoviesErrorState(
          errorMessage: failure.errorMessage),
      ),
      (movies) => emit(
        FetchTrendingOfWeekMoviesLoadedState(movies: movies),
      ),
    );
  }
}
