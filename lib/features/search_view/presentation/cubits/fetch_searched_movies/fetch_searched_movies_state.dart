part of 'fetch_searched_movies_cubit.dart';

@immutable
sealed class FetchSearchedMoviesState {}

final class FetchSearchedMoviesInitialState extends FetchSearchedMoviesState {}

final class FetchSearchedMoviesLoadingState extends FetchSearchedMoviesState {}

final class FetchSearchedMoviesLoadedState extends FetchSearchedMoviesState {
  final List<MovieEntity> movies;
  FetchSearchedMoviesLoadedState({required this.movies});
}

final class FetchSearchedMoviesErrorState extends FetchSearchedMoviesState {
  final String errorMessage;
  FetchSearchedMoviesErrorState({required this.errorMessage});
}
