import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:movies_pp/core/api/api_consumer.dart';
import 'package:movies_pp/core/api/endpoint.dart';
import 'package:movies_pp/core/entities/movie_entity.dart';
import 'package:movies_pp/core/functions/json_service.dart';

abstract class MoviesRemoteDataSource {
  Future<List<MovieEntity>> fetchPopularMovies();
  Future<List<MovieEntity>> fetchUpcomingMovies();
  Future<List<MovieEntity>> fetchTopRatedMovies();
  Future<List<MovieEntity>> fetchTrendingOfWeekMovies();
}

class MoviesRemoteDataSourceImpl extends MoviesRemoteDataSource {
  final ApiConsumer apiConsumer;

  MoviesRemoteDataSourceImpl({required this.apiConsumer});
  @override
  Future<List<MovieEntity>> fetchPopularMovies() async {
    Map<String, dynamic> jsonData = await fetchJsonData(
      apiConsumer: apiConsumer,
      endPoint: "movie/popular",
    );
    List<MovieEntity> movies = convertJsonToModel(jsonData);
    debugPrint("movies : \n $movies");
    await saveDataLocally(movies: movies, boxName: Endpoints.kPopularMoviesBox);
    return movies;
  }

  @override
  Future<List<MovieEntity>> fetchTopRatedMovies() async {
    Map<String, dynamic> jsonData = await fetchJsonData(
      apiConsumer: apiConsumer,
      endPoint: "movie/top_rated",
    );
    List<MovieEntity> movies = convertJsonToModel(jsonData);
    debugPrint("movies : \n $movies");
    await saveDataLocally(movies: movies, boxName: Endpoints.kTopRatedMoviesBox);

    return movies;
  }

  @override
  Future<List<MovieEntity>> fetchTrendingOfWeekMovies() async {
    Map<String, dynamic> jsonData = await fetchJsonData(
      apiConsumer: apiConsumer,
      endPoint: "trending/all/week",
    );
    List<MovieEntity> movies = convertJsonToModel(jsonData);
    debugPrint("movies : \n $movies");
    await saveDataLocally(
        movies: movies, boxName: Endpoints.kTrendingOfWeekMoviesBox);

    return movies;
  }

  @override
  Future<List<MovieEntity>> fetchUpcomingMovies() async {
    Map<String, dynamic> jsonData = await fetchJsonData(
      apiConsumer: apiConsumer,
      endPoint: "movie/upcoming",
    );
    List<MovieEntity> movies = convertJsonToModel(jsonData);
    debugPrint("movies : \n $movies");
    await saveDataLocally(movies: movies, boxName: Endpoints.kUpcomingMoviesBox);

    return movies;
  }

  Future<void> saveDataLocally(
      {required List<MovieEntity> movies, required String boxName}) async {
    await Hive.box<MovieEntity>(boxName).addAll(movies);
  }
}
