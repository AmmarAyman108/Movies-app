import 'package:flutter/material.dart';
import 'package:movies_pp/core/string.dart';
import 'package:movies_pp/core/widgets/custom_app_bar_text.dart';
import 'package:movies_pp/core/widgets/custom_divider.dart';
import 'package:movies_pp/features/movies_view/presentation/views/widgets/popular_movies.dart';
import 'package:movies_pp/features/movies_view/presentation/views/widgets/top_rated_movies.dart';
import 'package:movies_pp/features/movies_view/presentation/views/widgets/trending_of_week_movies.dart';
import 'package:movies_pp/features/movies_view/presentation/views/widgets/upcoming_movies.dart';

class MoviesViewBody extends StatelessWidget {
  const MoviesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            CustomAppBarText(
              title: StringManager.titleMoviesViewAppBar,
            ),
            SizedBox(
              height: 50,
            ),
            TrendingOfWeekMovies(),
            SizedBox(
              height: 20,
            ),
            CustomDivider(),
            SizedBox(
              height: 20,
            ),
            PopularMovies(),
            SizedBox(
              height: 20,
            ),
            CustomDivider(),
            SizedBox(
              height: 20,
            ),
            TopRatedMovies(),
            SizedBox(
              height: 20,
            ),
            CustomDivider(),
            SizedBox(
              height: 20,
            ),
            UpcomingMovies(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
