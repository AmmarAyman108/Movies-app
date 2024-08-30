import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_pp/core/api/dio_consumer.dart';
import 'package:movies_pp/features/movies_view/data/data_sources/local_data_source.dart';
import 'package:movies_pp/features/movies_view/data/data_sources/remote_data_source.dart';
import 'package:movies_pp/features/movies_view/data/repositories/movies_repo_impl.dart';
import 'package:movies_pp/features/search_view/data/data_sources/remote_data_source.dart';
import 'package:movies_pp/features/search_view/data/repositories/search_repo_impl.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<DioConsumer>(
    DioConsumer(
      dio: Dio(),
    ),
  );

  getIt.registerSingleton<MoviesRepoImpl>(MoviesRepoImpl(
    moviesLocalDataSource: MoviesLocalDataSourceImpl(),
    moviesRemoteDataSource:
        MoviesRemoteDataSourceImpl(apiConsumer: getIt.get<DioConsumer>()),
  ));

  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(
      searchRemoteDataSource:
          SearchRemoteDataSourceImpl(apiConsumer: getIt.get<DioConsumer>()),
    ),
  );
}
