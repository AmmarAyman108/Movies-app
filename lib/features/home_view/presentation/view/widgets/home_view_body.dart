import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:movies_pp/core/color.dart';
import 'package:movies_pp/features/movies_view/presentation/views/movies.dart';
import 'package:movies_pp/features/search_view/presentation/view/search.dart';
import 'package:movies_pp/features/settings_view/presentation/view/widgets/settings_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int currentIndex = 0;

  List<Widget> screens = const [
    MoviesView(),
    SearchView(),
    Scaffold(
      body: Center(
        child: Text('Soon'),
      ),
    ),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            onTap: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            unselectedIconTheme:
                const IconThemeData(color: ColorManager.kWhiteColor, size: 20),
            selectedIconTheme:
                const IconThemeData(color: ColorManager.kBlueColor, size: 24),
            currentIndex: currentIndex,
            backgroundColor: ColorManager.kBottomBarColor,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    FontAwesomeIcons.clapperboard,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                ),
                label: ' ',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.tv),
                label: ' ',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.gear),
                label: ' ',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
