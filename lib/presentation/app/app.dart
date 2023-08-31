import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tt_em/l10n/gen_l10n/app_localizations.dart';
import 'package:tt_em/presentation/navigations/router.dart';
import 'package:tt_em/presentation/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: '/home',
      title: 'InMing',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppThemeDataHolder.appThemeData,
      locale: AppLocalizations.supportedLocales.first,//todo replace when locale controller was implemented
      debugShowCheckedModeBanner: false,
    );
  }
}
