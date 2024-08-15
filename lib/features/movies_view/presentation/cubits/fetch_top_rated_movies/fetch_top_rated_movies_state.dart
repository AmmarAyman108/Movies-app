part of 'fetch_top_rated_movies_cubit.dart';

@immutable
sealed class FetchTopRatedMoviesState {}

final class FetchTopRatedMoviesInitialState extends FetchTopRatedMoviesState {}

final class FetchTopRatedMoviesLoadingState extends FetchTopRatedMoviesState {}

final class FetchTopRatedMoviesLoadedState extends FetchTopRatedMoviesState {   

  final List<MovieEntity> movies;

  FetchTopRatedMoviesLoadedState({required this.movies});
}

final class FetchTopRatedMoviesErrorState extends FetchTopRatedMoviesState {  

  final String errorMessage;

  FetchTopRatedMoviesErrorState({required this.errorMessage});
}
