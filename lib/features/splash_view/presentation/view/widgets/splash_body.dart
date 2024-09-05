import 'package:flutter/material.dart';
import 'package:movies_pp/config/router/routes.dart';
import 'package:movies_pp/core/assets.dart';
import 'package:movies_pp/core/string.dart';
import 'package:movies_pp/core/style.dart';
import 'package:movies_pp/core/widgets/custom_circle_avatar.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    navigateToOnBoardingScreen();
  }

  Future navigateToOnBoardingScreen() async {
    await Future.delayed(
        const Duration(seconds: 4),
        // ignore: use_build_context_synchronously
        () => Navigator.popAndPushNamed(context, Routes.onboarding));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomCircleAvatar(
            imagePath: AssetsManager.splash,
          ),
          SizedBox(height: 30),
          Text(
            StringManager.appName,
            textAlign: TextAlign.center,
            style: StyleManager.textStyle35,
          ),
        ],
      ),
    );
  }
}
