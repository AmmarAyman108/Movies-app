import 'package:flutter/material.dart';
import 'package:movies_pp/core/color.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String imagePath;
  const CustomCircleAvatar({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      radius: 122,
      child: CircleAvatar(
        radius: 120,
        backgroundImage: AssetImage(
          imagePath,
        ),
        backgroundColor: ColorManager.kBackgroundColor,
      ),
    );
  }
}
