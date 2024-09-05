import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_pp/core/color.dart';
import 'package:movies_pp/core/string.dart';
import 'package:movies_pp/core/widgets/custom_app_bar_text.dart';
import 'package:movies_pp/features/settings_view/presentation/manager/cubits/theme_cubit/theme_cubit.dart';

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
          const CustomAppBarText(title: StringManager.settingsText),
          const SizedBox(
            height: 50,
          ),
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return SwitchListTile(
                  activeColor: ColorManager.kBlueColor,
                  trackColor: const WidgetStatePropertyAll(
                      Color.fromARGB(255, 29, 55, 81)),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  title: const Text(StringManager.darkModeText),
                  secondary: const Icon(Icons.dark_mode),
                  value: BlocProvider.of<ThemeCubit>(context).isDark,
                  onChanged: (value) {
                    BlocProvider.of<ThemeCubit>(context).isDark
                        ? BlocProvider.of<ThemeCubit>(context)
                            .changeTheme(ThemeMode.light)
                        : BlocProvider.of<ThemeCubit>(context)
                            .changeTheme(ThemeMode.dark);
                  });
            },
          ),
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            leading: const Icon(Icons.help),
            title: const Text(StringManager.helpText),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
