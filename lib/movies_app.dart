import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_pp/config/router/app_router.dart';
import 'package:movies_pp/config/router/routes.dart';
import 'package:movies_pp/config/theme/app_theme.dart';
import 'package:movies_pp/core/locator.dart';
import 'package:movies_pp/features/movies_view/data/repositories/movies_repo_impl.dart';
import 'package:movies_pp/features/movies_view/domain/use_cases/fetch_popular_movies_use_case.dart';
import 'package:movies_pp/features/movies_view/domain/use_cases/fetch_top_rated_movies_use_case.dart';
import 'package:movies_pp/features/movies_view/domain/use_cases/fetch_trending_of_week_movies_use_case_.dart';
import 'package:movies_pp/features/movies_view/domain/use_cases/fetch_upcoming_movies_use_case.dart';
import 'package:movies_pp/features/movies_view/presentation/cubits/fetch_popular_movies/fetch_popular_movies_cubit.dart';
import 'package:movies_pp/features/movies_view/presentation/cubits/fetch_top_rated_movies/fetch_top_rated_movies_cubit.dart';
import 'package:movies_pp/features/movies_view/presentation/cubits/fetch_trending_of_week_movies/fetch_trending_of_week_movies_cubit.dart';
import 'package:movies_pp/features/movies_view/presentation/cubits/fetch_upcoming_movies/fetch_upcoming_movies_cubit.dart';
import 'package:movies_pp/features/settings_view/presentation/manager/cubits/theme_cubit/theme_cubit.dart';

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchPopularMoviesCubit(
            fetchPopularMoviesUseCase: FetchPopularMoviesUseCase(
              moviesRepo: getIt.get<MoviesRepoImpl>(),
            ),
          )..fetchPopularMovies(),
        ),
        BlocProvider(
          create: (context) => FetchTopRatedMoviesCubit(
            fetchTopRatedMoviesUseCase: FetchTopRatedMoviesUseCase(
              moviesRepo: getIt.get<MoviesRepoImpl>(),
            ),
          )..fetchTopRatedMovies(),
        ),
        BlocProvider(
          create: (context) => FetchUpcomingMoviesCubit(
            fetchUpcomingMoviesUseCase: FetchUpcomingMoviesUseCase(
              moviesRepo: getIt.get<MoviesRepoImpl>(),
            ),
          )..fetchUpcomingMovies(),
        ),
        BlocProvider(
          create: (context) => FetchTrendingOfWeekMoviesCubit(
            fetchTrendingOfWeekMoviesUseCase: FetchTrendingOfWeekMoviesUseCase(
              moviesRepo: getIt.get<MoviesRepoImpl>(),
            ),
          )..fetchTrendingOfWeekMovies(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit()..loadTheme(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: LightMode.get(),
            darkTheme:DarkMode.get() ,
            themeMode:state.themeMode,
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.splash,
            onGenerateRoute: AppRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
