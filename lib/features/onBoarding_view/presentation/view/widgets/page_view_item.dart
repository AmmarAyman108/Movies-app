import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_pp/core/style.dart';
import 'package:movies_pp/core/widgets/custom_circle_avatar.dart';
import 'package:movies_pp/features/onBoarding_view/data/models/poster.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.poster,
  });
  final PosterModel poster;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * .14),
        CustomCircleAvatar(imagePath: poster.image),
        const SizedBox(height: 30),
        SizedBox(
          width: 260,
          child: Text(
            textAlign: TextAlign.center,
            maxLines: 3,
            style: StyleManager.textStyle30,
            poster.title,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 220,
          child: Text(
            textAlign: TextAlign.center,
            maxLines: 3,
            style: StyleManager.textStyle16,
            poster.description,
          ),
        ),
      ],
    );
  }
}
