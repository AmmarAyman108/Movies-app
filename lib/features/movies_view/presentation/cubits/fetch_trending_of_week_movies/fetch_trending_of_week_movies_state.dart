part of 'fetch_trending_of_week_movies_cubit.dart';

@immutable
sealed class FetchTrendingOfWeekMoviesState {}

class FetchTrendingOfWeekMoviesInitialState
    extends FetchTrendingOfWeekMoviesState {}

class FetchTrendingOfWeekMoviesLoadingState extends FetchTrendingOfWeekMoviesState {}

class FetchTrendingOfWeekMoviesLoadedState
    extends FetchTrendingOfWeekMoviesState {
  final List<MovieEntity> movies;

  FetchTrendingOfWeekMoviesLoadedState({
    required this.movies,
  });
}


class  FetchTrendingOfWeekMoviesErrorState
    extends FetchTrendingOfWeekMoviesState {
  
  final String errorMessage;

  FetchTrendingOfWeekMoviesErrorState({
    required this.errorMessage,
  });
}