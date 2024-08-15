import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_pp/core/string.dart';
import 'package:movies_pp/core/widgets/custom_carousel_slider_widget.dart';
import 'package:movies_pp/core/widgets/custom_error_widget.dart';
import 'package:movies_pp/core/widgets/custom_loading_indecator_widget.dart';
import 'package:movies_pp/features/movies_view/presentation/cubits/fetch_popular_movies/fetch_popular_movies_cubit.dart';

class TrendingOfWeekMovies extends StatelessWidget {
  const TrendingOfWeekMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchPopularMoviesCubit, FetchPopularMoviesState>(
      builder: (context, state) {
        if (state is FetchPopularMoviesLoadedState) {
          return CustomCarouselSliderWidget(
            title: StringManager.titleMoviesViewCarouselSlider,
            movie: state.movies,
          );
        } else if (state is FetchPopularMoviesErrorState) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
