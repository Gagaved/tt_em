
import 'package:flutter/material.dart';
import 'package:tt_em/presentation/navigations/app_router.dart';
import 'package:tt_em/presentation/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppThemeDataHolder.appThemeData,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: '/',
    );
  }
}
