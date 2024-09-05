import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_pp/core/string.dart';
import 'package:movies_pp/core/style.dart';
import 'package:movies_pp/core/widgets/custom_app_bar_text.dart';
import 'package:movies_pp/features/search_view/presentation/cubits/fetch_searched_movies/fetch_searched_movies_cubit.dart';
import 'package:movies_pp/features/search_view/presentation/view/widgets/custom_text_field.dart';
import 'package:movies_pp/features/search_view/presentation/view/widgets/searched_movies.dart';

// ignore: must_be_immutable
class SearchViewBody extends StatelessWidget {
  TextEditingController? controller = TextEditingController();
  SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
            ),
          ),
          const SliverToBoxAdapter(
            child:
                CustomAppBarText(title: StringManager.titleMoviesSearchAppBar),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 40,
            ),
          ),
          SliverToBoxAdapter(
              child: CustomTextField(
                  controller: controller,
                  onEditingComplete: () {
                    BlocProvider.of<FetchSearchedMoviesCubit>(context)
                        .fetchSearchedMovies(movieName: controller?.text ?? '');
                  })),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 40,
            ),
          ),
          const SliverToBoxAdapter(
            child: Row(
              children: [
                Text(StringManager.resultMoviesText,
                    style: StyleManager.textStyle18),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 14,
            ),
          ),
          const SearchedMovies(),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 14,
            ),
          ),
        ],
      ),
    );
  }
}
