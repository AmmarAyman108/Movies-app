import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_pp/core/widgets/custom_error_widget.dart';
import 'package:movies_pp/core/widgets/custom_loading_indecator_widget.dart';
import 'package:movies_pp/features/search_view/presentation/cubits/fetch_searched_movies/fetch_searched_movies_cubit.dart';
import 'package:movies_pp/features/search_view/presentation/view/widgets/custom_grid_view.dart';

class SearchedMovies extends StatelessWidget {
  const SearchedMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchSearchedMoviesCubit, FetchSearchedMoviesState>(
      builder: (context, state) {
        if (state is FetchSearchedMoviesLoadedState) {
          return SliverToBoxAdapter(
            child: CustomGridView(
              movies: state.movies,
            ),
          );
        } else if (state is FetchSearchedMoviesErrorState) {
          return SliverFillRemaining(
              hasScrollBody: false,
              child: CustomErrorWidget(errorMessage: state.errorMessage));
        } else if (state is FetchSearchedMoviesLoadingState) {
          return const SliverFillRemaining(
              hasScrollBody: false, child: CustomLoadingIndicator());
        } else {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Text("search for movie"),
            ),
          );
        }
      },
    );
  }
}
