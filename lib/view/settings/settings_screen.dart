import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/localization/locale_cubit.dart';
import '../../bloc/theme/theme_bloc.dart';
import '../../localization/app_localization.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate('settings')),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
                  builder: (context, state) {
                    return DropdownButton<String>(
                      value: state.locale.languageCode,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: ['hi', 'en'].map((String items) {
                        return DropdownMenuItem<String>(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          context.read<LocaleCubit>().changeLanguage(newValue);
                        }
                      },
                    );
                  },
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<ThemeBloc, ThemeData>(
                builder: (context, themeData) {
                  return CupertinoSwitch(
                      value: themeData == ThemeData.dark(),
                      onChanged: (bool val) {
                        BlocProvider.of<ThemeBloc>(context)
                            .add(ThemeSwitchEvent());
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
