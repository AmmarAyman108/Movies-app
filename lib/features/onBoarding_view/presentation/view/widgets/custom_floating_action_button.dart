import 'package:flutter/material.dart';
import 'package:movies_pp/core/color.dart';
import 'package:movies_pp/features/home_view/presentation/view/home.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
    required this.isLast,
    required PageController pageController,
  }) : _pageController = pageController;

  final bool isLast;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      focusColor: Colors.white,
      backgroundColor: ColorManager.kBlueColor,
      onPressed: () {
        if (isLast) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeView()),
              (route) => false);
        } else {
          _pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut);
        }
      },
      child: const Icon(Icons.chevron_right),
    );
  }
}
