import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_pp/core/locator.dart';
import 'package:movies_pp/features/search_view/data/repositories/search_repo_impl.dart';
import 'package:movies_pp/features/search_view/domain/use_cases/fetch_searched_movies_use_case.dart';
import 'package:movies_pp/features/search_view/presentation/cubits/fetch_searched_movies/fetch_searched_movies_cubit.dart';
import 'package:movies_pp/features/search_view/presentation/view/widgets/search_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (context) => FetchSearchedMoviesCubit(
        fetchSearchedMoviesUseCase: FetchSearchedMoviesUseCase(
                          searchRepo: getIt.get<SearchRepoImpl>(),
                        )
      ),
      child: SearchViewBody(),
    ));
  }
}