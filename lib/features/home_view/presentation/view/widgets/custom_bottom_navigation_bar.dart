import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:movies_pp/core/color.dart';

// ignore: must_be_immutable
class CustomBottomNavigationBar extends StatefulWidget {
  int c;
  CustomBottomNavigationBar({super.key, required this.c});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
      child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          onTap: (int index) {
            setState(() {
              widget.c = index;
            });
          },
          iconSize: 23,
          unselectedIconTheme:
              const IconThemeData(color: ColorManager.kWhiteColor, size: 20),
          selectedIconTheme:
              const IconThemeData(color: ColorManager.kBlueColor, size: 24),
          currentIndex: 0,
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
          ]),
    );
  }
}
