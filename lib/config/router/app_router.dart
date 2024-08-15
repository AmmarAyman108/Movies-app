import 'package:flutter/material.dart';
import 'package:movies_pp/config/router/routes.dart';
import 'package:movies_pp/core/entities/movie_entity.dart';
import 'package:movies_pp/features/home_view/presentation/view/home.dart';
import 'package:movies_pp/features/movies_view/presentation/views/movies_details.dart';
import 'package:movies_pp/features/onBoarding_view/presentation/view/onboarding_view.dart';
import 'package:movies_pp/features/search_view/presentation/view/search.dart';
import 'package:movies_pp/features/splash_view/presentation/view/splash.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnboardingView(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
      case Routes.search:
        return MaterialPageRoute(
          builder: (context) => const SearchView(),
        );
      case Routes.moviesDetails:
        return MaterialPageRoute(
          builder: (context) => MoviesDetails(
            movie: settings.arguments as MovieEntity,
          ),
        );
      default:
        return unDefineRoute();
    }
  }
}

Route unDefineRoute() {
  return MaterialPageRoute(
    builder: (context) => const Scaffold(
      body: Center(
        child: Text('No route defined'),
      ),
    ),
  );
}
