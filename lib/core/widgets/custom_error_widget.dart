import 'package:flutter/material.dart';
import 'package:movies_pp/core/color.dart';
import 'package:movies_pp/core/style.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;
  const CustomErrorWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text(
          errorMessage,
          style: StyleManager.textStyle18.copyWith(
            color: ColorManager.kRedColor,
          ),
        ),
      ),
    );
  }
}
