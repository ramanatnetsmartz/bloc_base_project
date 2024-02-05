import 'package:flutter_base_project/bloc/home/home_bloc.dart';
import 'package:flutter_base_project/bloc/theme/theme_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'localization/locale_cubit.dart';

class BlocProviders {
  static final List<BlocProvider> providers = [
    BlocProvider(
      create: (context) => LocaleCubit()..getSavedLanguage(),
    ),
    BlocProvider(create: (_) => HomeBloc()),
    BlocProvider(create: (_) => ThemeBloc()..add(InitialThemeSetEvent()))
  ];
}
