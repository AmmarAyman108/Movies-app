import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:movies_pp/core/entities/movie_entity.dart';
import 'package:movies_pp/core/style.dart';
import 'package:movies_pp/core/widgets/custom_movie_widget.dart';

class CustomCarouselSliderWidget extends StatelessWidget {
  final String title;
  final List<MovieEntity> movie;
  const CustomCarouselSliderWidget({
    super.key,
    required this.title,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * .32;

    return Column(
      children: [
        Row(
          children: [
            Text(title, style: StyleManager.textStyle18),
          ],
        ),
        const SizedBox(
          height: 14,
        ),
        SizedBox(
          height: height,
          child: CarouselSlider.builder(
            itemCount: movie.length,
            itemBuilder: (context, index, realIndex) => ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Movies(
                movie: movie[index],
              ),
            ),
            options: CarouselOptions(
              height: height,
              aspectRatio: 16 / 9,
              viewportFraction: 0.50,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.27,
              scrollDirection: Axis.horizontal,
            ),
          ),
        )
      ],
    );
  }
}
