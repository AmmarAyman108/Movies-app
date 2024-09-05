import 'package:movies_pp/core/api/api_consumer.dart';
import 'package:movies_pp/core/api/endpoint.dart';
import 'package:movies_pp/core/entities/movie_entity.dart';
import 'package:movies_pp/core/models/movies_model.dart';

convertJsonToModel(Map<String, dynamic> jsonData) {
  List<MovieEntity> movies = [];
  for (var element in jsonData[ApiKeys.results]) {
    movies.add(MovieModel.fromJson(element));
  }
  return movies;
}

Future<Map<String, dynamic>> fetchJsonData(
    {required String endPoint,
    required ApiConsumer apiConsumer,
    Map<String, dynamic>? queryParameter}) async {
  Map<String, dynamic>? queryParameters = {
    ApiKeys.apiKey: Endpoints.apiKey,
    ApiKeys.page: 1
  };
  if (queryParameter != null) {
    queryParameters.addAll(queryParameter);
  }
  Map<String, dynamic> jsonData = await apiConsumer.get(
      endPoint: endPoint, queryParameters: queryParameters);
  return jsonData;
}
