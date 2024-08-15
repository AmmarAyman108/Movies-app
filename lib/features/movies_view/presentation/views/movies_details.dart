import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_pp/core/color.dart';
import 'package:movies_pp/core/entities/movie_entity.dart';
import 'package:movies_pp/core/style.dart';

class MoviesDetails extends StatelessWidget {
  final MovieEntity movie;
  const MoviesDetails({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: movie.imageUrl,
                        height: 500,
                        fit: BoxFit.fill,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .7,
                          child: Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            movie.title,
                            style: StyleManager.textStyle25,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.star,
                          size: 22,
                          color: Colors.amber,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '(${movie.rating.toStringAsFixed(2)})',
                          style: StyleManager.textStyle20,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              Color.fromARGB(255, 39, 42, 48)),
                          foregroundColor:
                              WidgetStatePropertyAll(ColorManager.kBlueColor),
                          padding: WidgetStatePropertyAll(EdgeInsets.all(15))),
                      child: const Text(
                        "Watch",
                        style: StyleManager.textStyle20,
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Description',
                      style: StyleManager.textStyle20,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      movie.description,
                      style: StyleManager.textStyle16,
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
                Positioned(
                  top: 35,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: const ButtonStyle(
                          padding: WidgetStatePropertyAll(EdgeInsets.all(10)),
                          shape: WidgetStatePropertyAll(CircleBorder()),
                          backgroundColor: WidgetStatePropertyAll(
                              Color.fromARGB(47, 138, 138, 138))),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 30,
                        color: Colors.white,
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
