
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_pp/core/string.dart';
import 'package:movies_pp/core/widgets/custom_error_widget.dart';
import 'package:movies_pp/core/widgets/custom_list_category_widget.dart';
import 'package:movies_pp/core/widgets/custom_loading_indecator_widget.dart';
import 'package:movies_pp/features/movies_view/presentation/cubits/fetch_upcoming_movies/fetch_upcoming_movies_cubit.dart';

class UpcomingMovies extends StatelessWidget {
  const UpcomingMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchUpcomingMoviesCubit,
       FetchUpcomingMoviesState>(
     builder: (context, state) {
       if (state is FetchUpcomingMoviesLoadedState) {
         return CustomListCategoryWidget(
           categoryName: StringManager.upComingMoviesTitle,
           movies: state.movies,
         );
       } else if (state is FetchUpcomingMoviesErrorState) {
         return CustomErrorWidget(errorMessage: state.errorMessage);
       } else {
         return const CustomLoadingIndicator();
       }
     },
                );
  }
}
