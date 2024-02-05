import 'package:flutter/material.dart';
import 'package:flutter_base_project/app_resources/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'bloc/home/home_bloc.dart';
import 'bloc/localization/locale_cubit.dart';
import 'bloc/providers.dart';
import 'bloc/theme/theme_bloc.dart';
import 'localization/app_localization.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocaleCubit()..getSavedLanguage(),
        ),
        BlocProvider(create: (_) => HomeBloc()),
        BlocProvider(create: (_) => ThemeBloc()..add(InitialThemeSetEvent()))
      ],
      child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
        builder: (context, state) {
          return BlocBuilder<ThemeBloc, ThemeData>(
            builder: (context, themeState) {
              return MaterialApp(
                onGenerateRoute: AppRoutes.generateRoutes,
                initialRoute: home,
                theme: themeState,
                locale: state.locale,
                supportedLocales: const [Locale('en'), Locale('hi')],
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  for (var locale in supportedLocales) {
                    if (deviceLocale != null &&
                        deviceLocale.languageCode == locale.languageCode) {
                      return deviceLocale;
                    }
                  }
                  return supportedLocales.first;
                },
                debugShowCheckedModeBanner: false,
              );
            },
          );
        },
      ),
    );
  }
}
