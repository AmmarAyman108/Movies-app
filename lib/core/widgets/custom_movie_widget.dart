import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:movies_pp/config/router/routes.dart';
import 'package:movies_pp/core/entities/movie_entity.dart';
import 'package:movies_pp/core/style.dart';

class Movies extends StatelessWidget {
  final MovieEntity? movie;
  const Movies({
    super.key,
    this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 3,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: GestureDetector(
            onTap: () async {
              Navigator.pushNamed(context, Routes.moviesDetails,
                  arguments: movie);
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                  CachedNetworkImage(
            imageUrl:movie!.imageUrl,
            fit: BoxFit.fill,
            placeholder: (context, url) => const Center(
              child: CupertinoActivityIndicator(),
            ),
            errorWidget: (context, url, error) =>
                const Icon(FontAwesomeIcons.circleExclamation),
          ),
                Positioned(
                  right: 8,
                  top: 5,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 15,
                        color: Color.fromARGB(255, 222, 167, 1),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        movie!.rating.toStringAsFixed(2),
                        style: StyleManager.textStyle14
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
         
          ),
    );
  }
}
