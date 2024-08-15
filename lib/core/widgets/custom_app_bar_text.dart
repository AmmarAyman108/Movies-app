// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:movies_pp/core/style.dart';

class CustomAppBarText extends StatelessWidget {
  final String title;
  const CustomAppBarText({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * .8,
          child: Text(
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.visible,
            title,
            style: StyleManager.textStyle30,
          ),
        ),
      ],
    );
  }
}
