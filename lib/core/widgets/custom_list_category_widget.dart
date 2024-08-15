import 'package:flutter/material.dart';
import 'package:movies_pp/core/entities/movie_entity.dart';
import 'package:movies_pp/core/style.dart';
import 'package:movies_pp/core/widgets/custom_movie_widget.dart';

class CustomListCategoryWidget extends StatelessWidget {
  final String categoryName;
  final List<MovieEntity> movies;
  const CustomListCategoryWidget({
    super.key,
    required this.categoryName,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * .3;

    return Column(
      children: [
        Row(
          children: [
            Text(categoryName, style: StyleManager.textStyle18),
          ],
        ),
        const SizedBox(
          height: 14,
        ),
        SizedBox(
          height: height,
          child: ListView.builder(
            itemCount: movies.length,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Movies(
                movie: movies[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
