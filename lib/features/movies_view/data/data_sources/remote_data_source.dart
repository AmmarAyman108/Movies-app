import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:movies_pp/core/api_methods/api_methods.dart';
import 'package:movies_pp/core/constants.dart';
import 'package:movies_pp/core/entities/movie_entity.dart';
import 'package:movies_pp/core/functions/json_service.dart';

abstract class MoviesRemoteDataSource {
  Future<List<MovieEntity>> fetchPopularMovies();
  Future<List<MovieEntity>> fetchUpcomingMovies();
  Future<List<MovieEntity>> fetchTopRatedMovies();
  Future<List<MovieEntity>> fetchTrendingOfWeekMovies();
}

class MoviesRemoteDataSourceImpl extends MoviesRemoteDataSource {
  final ApiService apiService;

  MoviesRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<MovieEntity>> fetchPopularMovies() async {
    Map<String, dynamic> jsonData = await fetchJsonData(
      apiService: apiService,
      endPoint: "movie/popular",
    );
    List<MovieEntity> movies = convertJsonToModel(jsonData);
    debugPrint("movies : \n $movies");
    await saveDataLocally(movies: movies, boxName: Settings.kPopularMoviesBox);
    return movies;
  }

  @override
  Future<List<MovieEntity>> fetchTopRatedMovies() async {
    Map<String, dynamic> jsonData = await fetchJsonData(
      apiService: apiService,
      endPoint: "movie/top_rated",
    );
    List<MovieEntity> movies = convertJsonToModel(jsonData);
    debugPrint("movies : \n $movies");
    await saveDataLocally(movies: movies, boxName: Settings.kTopRatedMoviesBox);

    return movies;
  }

  @override
  Future<List<MovieEntity>> fetchTrendingOfWeekMovies() async {
    Map<String, dynamic> jsonData = await fetchJsonData(
      apiService: apiService,
      endPoint: "trending/all/week",
    );
    List<MovieEntity> movies = convertJsonToModel(jsonData);
    debugPrint("movies : \n $movies");
    await saveDataLocally(
        movies: movies, boxName: Settings.kTrendingOfWeekMoviesBox);

    return movies;
  }

  @override
  Future<List<MovieEntity>> fetchUpcomingMovies() async {
    Map<String, dynamic> jsonData = await fetchJsonData(
      apiService: apiService,
      endPoint: "movie/upcoming",
    );
    List<MovieEntity> movies = convertJsonToModel(jsonData);
    debugPrint("movies : \n $movies");
    await saveDataLocally(movies: movies, boxName: Settings.kUpcomingMoviesBox);

    return movies;
  }

  Future<void> saveDataLocally(
      {required List<MovieEntity> movies, required String boxName}) async {
    await Hive.box<MovieEntity>(boxName).addAll(movies);
  }
}
