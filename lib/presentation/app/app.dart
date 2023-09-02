import 'package:flutter/material.dart';
import 'package:tt_em/l10n/gen_l10n/app_localizations.dart';
import 'package:tt_em/presentation/pages/hotel_page/hotel_page.dart';
import 'package:tt_em/presentation/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,/// Удаляет дебаг плашку в углу
      title: 'ее_em',

      ///
      ///
      /// Themes
      theme: AppThemeDataHolder.appThemeData,
      //darkTheme: AppThemeDataHolder.appDarkThemeData,//todo uncomment when dark theme is implemented

      ///
      ///
      /// Localization
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: AppLocalizations.supportedLocales.first, // todo replace when locale controller is implemented

      ///
      ///
      ///Navigation
      home: const HotelPage(),// todo replace to initialRoute when app router is implemented
      //initialRoute = '/';
      //onGenerateRoute = '/AppRouter.onGenerateRoute'
    );
  }
}
