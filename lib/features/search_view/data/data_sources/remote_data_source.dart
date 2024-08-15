import 'package:flutter/material.dart';
import 'package:movies_pp/core/api_methods/api_methods.dart';
import 'package:movies_pp/core/entities/movie_entity.dart';
import 'package:movies_pp/core/functions/json_service.dart';

abstract class SearchRemoteDataSource {
  Future<List<MovieEntity>> fetchSearchedMovies({required String movieName});
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<MovieEntity>> fetchSearchedMovies({required String movieName}) async {
    Map<String, dynamic> jsonData = await fetchJsonData(
      apiService: apiService,
      endPoint: "search/movie",
      queryParameter: {"query": movieName},
    );
    List<MovieEntity> movies = convertJsonToModel(jsonData);
    debugPrint("movies : \n $movies");
    return movies;
  }



  
}
