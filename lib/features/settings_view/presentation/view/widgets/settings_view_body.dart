import 'package:flutter/material.dart';
import 'package:movies_pp/core/color.dart';
import 'package:movies_pp/core/widgets/custom_app_bar_text.dart';

class SettingsViewBody extends StatefulWidget {
  const SettingsViewBody({
    super.key,
  });

  @override
  State<SettingsViewBody> createState() => _SettingsViewBodyState();
}

class _SettingsViewBodyState extends State<SettingsViewBody> {
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          const CustomAppBarText(title: 'Settings'),
          const SizedBox(
            height: 50,
          ),
          SwitchListTile(
              activeColor: ColorManager.kBlueColor,
              trackColor:
                  const WidgetStatePropertyAll(Color.fromARGB(255, 29, 55, 81)),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              title: const Text('Dark Mode'),
              secondary: const Icon(Icons.dark_mode),
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value;
                });
              }),
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            leading: const Icon(Icons.help),
            title: const Text('Help'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
