import 'package:flutter/material.dart';
import 'package:movies_pp/core/entities/movie_entity.dart';
import 'package:movies_pp/core/widgets/custom_movie_widget.dart';

class CustomGridView extends StatelessWidget {
  
  final List<MovieEntity> movies;
  const CustomGridView({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: movies.length,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            childAspectRatio: 2 / 3,
            mainAxisSpacing: 30),
        itemBuilder: (context, index) =>  Movies(movie: movies[index],));
  }
}
