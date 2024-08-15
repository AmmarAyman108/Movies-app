import 'package:flutter/material.dart';
import 'package:movies_pp/core/color.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      width: MediaQuery.of(context).size.width,
      child: const Center(
        child: CircularProgressIndicator(
          color: ColorManager.kWhiteColor,
        ),
      ),
    );
  }
}
