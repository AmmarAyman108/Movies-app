import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_pp/core/api_methods/api_methods.dart';
import 'package:movies_pp/core/constants.dart';
import 'package:movies_pp/features/movies_view/data/data_sources/local_data_source.dart';
import 'package:movies_pp/features/movies_view/data/data_sources/remote_data_source.dart';
import 'package:movies_pp/features/movies_view/data/repositories/movies_repo_impl.dart';
import 'package:movies_pp/features/search_view/data/data_sources/remote_data_source.dart';
import 'package:movies_pp/features/search_view/data/repositories/search_repo_impl.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<MoviesRepoImpl>(MoviesRepoImpl(
    moviesLocalDataSource: MoviesLocalDataSourceImpl(),
    moviesRemoteDataSource: MoviesRemoteDataSourceImpl(
      apiService: ApiService(
        dio: Dio(BaseOptions(
            baseUrl: Settings.baseUrl,
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30))),
      ),
    ),
  ));

  getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl(
      searchRemoteDataSource: SearchRemoteDataSourceImpl(
    apiService: ApiService(
      dio: Dio(BaseOptions(
          baseUrl: Settings.baseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30))),
    ),
  )));

  // getIt.registerSingleton<ApiService>(ApiService(
  //   dio: Dio(
  //     BaseOptions(
  //       baseUrl:Settings.baseUrl,
  //       connectTimeout:
  //       const Duration(seconds:
  //       30)
  //       ,
  //       receiveTimeout:  const Duration(seconds:
  //       30),
  //     ),
  //   ),
  // ));
}
