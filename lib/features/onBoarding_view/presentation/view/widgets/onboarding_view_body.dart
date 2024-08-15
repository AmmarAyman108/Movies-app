import 'package:flutter/material.dart';
import 'package:movies_pp/core/assets.dart';
import 'package:movies_pp/core/color.dart';
import 'package:movies_pp/core/string.dart';
import 'package:movies_pp/features/home_view/presentation/view/home.dart';
import 'package:movies_pp/features/onBoarding_view/data/models/poster.dart';
import 'package:movies_pp/features/onBoarding_view/presentation/view/widgets/custom_floating_action_button.dart';
import 'package:movies_pp/features/onBoarding_view/presentation/view/widgets/custom_smooth_page_indicator.dart';
import 'package:movies_pp/features/onBoarding_view/presentation/view/widgets/page_view_item.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  List<PosterModel> posters = [
    PosterModel(
        image: AssetsManager.onBoardingOne,
        title: StringManager.onBoardingTitle,
        description: StringManager.onBoardingDescription),
    PosterModel(
        image: AssetsManager.onBoardingTwo,
        title: StringManager.onBoardingTitle,
        description: StringManager.onBoardingDescription),
    PosterModel(
        image: AssetsManager.onBoardingThree,
        title: StringManager.onBoardingTitle,
        description: StringManager.onBoardingDescription)
  ];

  final PageController _pageController = PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) => const HomeView())
                    , (route) => false);
              },
              child: const Text(
                StringManager.skipText,
                style: TextStyle(color: ColorManager.kBlueColor),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (value) {
                if (value == posters.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => PageViewItem(
                poster: posters[index],
              ),
              itemCount: posters.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30, left: 20),
            child: CustomSmoothPageIndicator(pageController: _pageController),
          ),
        ],
      ),
      floatingActionButton: CustomFloatingActionButton(
          isLast: isLast, pageController: _pageController),
    );
  }
}
