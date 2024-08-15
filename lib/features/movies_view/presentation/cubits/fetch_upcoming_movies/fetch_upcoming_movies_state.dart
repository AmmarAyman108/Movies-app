part of 'fetch_upcoming_movies_cubit.dart';

@immutable
sealed class FetchUpcomingMoviesState {}

final class FetchUpcomingMoviesInitialState extends FetchUpcomingMoviesState {}

final class FetchUpcomingMoviesLoadingState extends FetchUpcomingMoviesState {}

final class FetchUpcomingMoviesLoadedState extends FetchUpcomingMoviesState {
  final List<MovieEntity> movies;

  FetchUpcomingMoviesLoadedState({
    required this.movies,
  });
}

final class FetchUpcomingMoviesErrorState extends FetchUpcomingMoviesState {
  final String errorMessage;

  FetchUpcomingMoviesErrorState({
    required this.errorMessage,
  });
}
