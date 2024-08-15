
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_pp/core/string.dart';
import 'package:movies_pp/core/widgets/custom_error_widget.dart';
import 'package:movies_pp/core/widgets/custom_list_category_widget.dart';
import 'package:movies_pp/core/widgets/custom_loading_indecator_widget.dart';
import 'package:movies_pp/features/movies_view/presentation/cubits/fetch_top_rated_movies/fetch_top_rated_movies_cubit.dart';

class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchTopRatedMoviesCubit,
        FetchTopRatedMoviesState>(
      builder: (context, state) {
        if (state is FetchTopRatedMoviesLoadedState) {
          return CustomListCategoryWidget(
            categoryName: StringManager.topRatedMoviesTitle,
            movies: state.movies,
          );
        } else if (state is FetchTopRatedMoviesErrorState) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
