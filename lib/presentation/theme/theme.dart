import 'package:flutter/material.dart';
import 'package:tt_em/presentation/constants/colors.dart';

class TaskStyle extends ThemeExtension<TaskStyle> {
  final Color? correctColor;

  final Color? wrongColor;

  final Color? unknownColor;

  final Color? correctOnPrimary;
  final Color? wrongOnPrimary;
  final Color? onCorrect;
  final Color? onWrong;

  const TaskStyle({
    this.correctOnPrimary,
    this.wrongOnPrimary,
    this.correctColor,
    this.wrongColor,
    this.unknownColor,
    this.onCorrect,
    this.onWrong,
  });

  @override
  TaskStyle copyWith({
    final Color? correctOnPrimary,
    final Color? onCorrect,
    final Color? wrongOnPrimary,
    final Color? onWrong,
    final Color? correctColor,
    final Color? wrongColor,
    final Color? unknownColor,
  }) {
    return TaskStyle(
      correctOnPrimary: correctOnPrimary ?? this.correctOnPrimary,
      wrongOnPrimary: wrongOnPrimary ?? this.wrongOnPrimary,
      correctColor: correctColor ?? this.correctColor,
      wrongColor: wrongColor ?? this.wrongColor,
      unknownColor: unknownColor ?? this.unknownColor,
      onCorrect: onCorrect ?? this.onCorrect,
      onWrong: onCorrect ?? this.onWrong,
    );
  }

  @override
  TaskStyle lerp(ThemeExtension<TaskStyle>? other, double t) {
    if (other is! TaskStyle) {
      return this;
    }
    return TaskStyle(
        correctOnPrimary:
        Color.lerp(correctOnPrimary, other.correctOnPrimary, t),
        wrongOnPrimary: Color.lerp(wrongOnPrimary, other.wrongOnPrimary, t),
        correctColor: Color.lerp(correctColor, other.correctColor, t),
        wrongColor: Color.lerp(wrongColor, other.wrongColor, t),
        unknownColor: unknownColor);
  }
}

class AppThemeDataHolder {
  static ThemeData appThemeData = ThemeData(
      extensions: const <ThemeExtension<dynamic>>[
      ],
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      highlightColor: AppColors.highlightColor,
      hoverColor: AppColors.hoverColor,
      focusColor: AppColors.focusColor,
      splashColor: AppColors.splashColor,
      cardTheme: const CardTheme(
        surfaceTintColor: Colors.transparent,
        color: AppColors.surfaceColor,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.primaryColor,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.primaryColor,
      ),
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            iconColor: MaterialStateProperty.all<Color>(
              AppColors.primaryColor,
            ),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          )),
      inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: AppColors.onSurfaceColor)),
      scrollbarTheme: const ScrollbarThemeData(
        thumbColor: MaterialStatePropertyAll(AppColors.primaryColor),
      ),
      elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStatePropertyAll(AppColors.secondaryColor),
          )),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        primary: AppColors.primaryColor,
        onPrimary: AppColors.onPrimaryColor,
        secondary: AppColors.secondaryColor,
        onSecondary: AppColors.onSecondaryColor,
        error: AppColors.errorColor,
        onError: AppColors.onErrorColor,
        background: AppColors.backgroundColor,
        onBackground: AppColors.onBackgroundColor,
        surface: AppColors.surfaceColor,
        onSurface: AppColors.onSurfaceColor,
      ));
}
