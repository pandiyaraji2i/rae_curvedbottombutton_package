import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:theme_management/theme_management.dart';
import 'package:rae_localization_package/rae_localization_package.dart';

class ThemeAndMaterialWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _localeModeWidget();
  }

  /// Widget wrapper to enclose the BlocBuilder that manages state for changing lanaguage/locale
  Widget _localeModeWidget() {
    return BlocBuilder(
      bloc: RAELanguage.cubit,
      builder: (_, state) => BlocBuilder(bloc: ThemeManagement.themeModeCubit, builder: (context, _) => _materialAppBloc()),
    );
  }

  /// Widget wrapper to enclose switching dark/light mode themes of the MaterialApp
  Widget _materialAppBloc() {
    return BlocBuilder<ThemeModeCubit, ThemeModeState>(
        bloc: ThemeManagement.themeModeCubit,
        builder: (_, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            locale: RAELanguage.locale,
            theme: ThemeManagement.lightTheme,
            darkTheme: ThemeManagement.darkTheme,
            themeMode: ThemeManagement.themeMode,
            initialRoute: '/',
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('de'), // German, no country code
              const Locale('en'), // English, no country code
              const Locale('es'), // Spanish, no country code
              const Locale('ko'), // Korean, no country code
            ],
          ).modular();
        });
  }
}
