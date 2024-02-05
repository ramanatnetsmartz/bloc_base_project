To change locale from any where in the app use this line of code.
context.read<LocaleCubit>().changeLanguage(newValue); // newValue can be en, hi etc

To change theme from anythere in the app use this line of code
context.read<ThemeBloc>().add(ThemeSwitchEvent())
