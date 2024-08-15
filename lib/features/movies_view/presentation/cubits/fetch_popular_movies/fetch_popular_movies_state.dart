part of 'fetch_popular_movies_cubit.dart';

@immutable
sealed class FetchPopularMoviesState {}

final class FetchPopularMoviesInitialState extends FetchPopularMoviesState {}


final class FetchPopularMoviesLoadingState extends FetchPopularMoviesState {}

final class FetchPopularMoviesLoadedState extends FetchPopularMoviesState {

  final List<MovieEntity> movies;
  FetchPopularMoviesLoadedState({required this.movies});

}
final class FetchPopularMoviesErrorState extends FetchPopularMoviesState {

  final String errorMessage;
  FetchPopularMoviesErrorState({required this.errorMessage});

}