import 'package:movies_pp/core/api/api_consumer.dart';
import 'package:movies_pp/core/api/endpoint.dart';
import 'package:movies_pp/core/entities/movie_entity.dart';
import 'package:movies_pp/core/functions/json_service.dart';

abstract class SearchRemoteDataSource {
  Future<List<MovieEntity>> fetchSearchedMovies({required String movieName});
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiConsumer apiConsumer;

  SearchRemoteDataSourceImpl({required this.apiConsumer});
  @override
  Future<List<MovieEntity>> fetchSearchedMovies({required String movieName}) async {
    Map<String, dynamic> jsonData = await fetchJsonData(
      apiConsumer: apiConsumer,
      endPoint:Endpoints.searchMovie ,
      queryParameter: {ApiKeys.query: movieName},
    );
    List<MovieEntity> movies = convertJsonToModel(jsonData);
    return movies;
  }



  
}
