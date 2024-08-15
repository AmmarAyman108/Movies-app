import 'package:movies_pp/core/api_methods/api_methods.dart';
import 'package:movies_pp/core/constants.dart';
import 'package:movies_pp/core/entities/movie_entity.dart';
import 'package:movies_pp/core/models/movies_model.dart';

convertJsonToModel(Map<String, dynamic> jsonData) {
  List<MovieEntity> movies = [];
  for (var element in jsonData['results']) {
    movies.add(MovieModel.fromJson(element));
  }
  return movies;
}

Future<Map<String, dynamic>> fetchJsonData(
    {required String endPoint,
    required ApiService apiService,
    Map<String, dynamic>? queryParameter}) async {
  Map<String, dynamic>? queryParameters = {
    "api_key": Settings.apiKey,
    "page": 1
  };
  if (queryParameter != null) {
    queryParameters.addAll(queryParameter);
  }
  Map<String, dynamic> jsonData = await apiService.get(
      endPoint: endPoint, queryParameters: queryParameters);
  return jsonData;
}
//