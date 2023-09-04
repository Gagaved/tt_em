import 'package:flutter/material.dart';
import 'package:tt_em/presentation/constants/colors.dart';

class RatingStyle extends ThemeExtension<RatingStyle> {
  final Color main1;
  final Color second1;
  final Color main2;
  final Color second2;
  final Color main3;
  final Color second3;
  final Color main4;
  final Color second4;
  final Color main5;
  final Color second5;

  const RatingStyle(
      {required this.main1,
      required this.second1,
      required this.main2,
      required this.second2,
      required this.main3,
      required this.second3,
      required this.main4,
      required this.second4,
      required this.main5,
      required this.second5});

  @override
  RatingStyle copyWith({
    final Color? main1,
    final Color? second1,
    final Color? main2,
    final Color? second2,
    final Color? main3,
    final Color? second3,
    final Color? main4,
    final Color? second4,
    final Color? main5,
    final Color? second5,
  }) {
    return RatingStyle(
      main1: main1 ?? this.main1,
      second1: second1 ?? this.second1,
      main2: main2 ?? this.main2,
      second2: second2 ?? this.second2,
      main3: main3 ?? this.main3,
      second3: second3 ?? this.second3,
      main4: main4 ?? this.main4,
      second4: second4 ?? this.second4,
      main5: main5 ?? this.main5,
      second5: second5 ?? this.second5,
    );
  }

  @override
  RatingStyle lerp(ThemeExtension<RatingStyle>? other, double t) {
    if (other is! RatingStyle) {
      return this;
    }
    return RatingStyle(
        main1: Color.lerp(main1, other.main1, t)!,
        main2: Color.lerp(main2, other.main2, t)!,
        main3: Color.lerp(main3, other.main3, t)!,
        main4: Color.lerp(main4, other.main4, t)!,
        main5: Color.lerp(main5, other.main5, t)!,
        second1: Color.lerp(second1, other.second1, t)!,
        second2: Color.lerp(second2, other.second2, t)!,
        second3: Color.lerp(second3, other.second3, t)!,
        second4: Color.lerp(second4, other.second4, t)!,
        second5: Color.lerp(second5, other.second5, t)!);
  }
}

class AppThemeDataHolder {
  static ThemeData appThemeData = ThemeData(
      extensions: const <ThemeExtension<dynamic>>[
        RatingStyle(
          //todo add colors for 1,2,3,4 rating
          main1: AppColors.ratingMainColor1,
          main2: AppColors.ratingMainColor2,
          main3: AppColors.ratingMainColor3,
          main4: AppColors.ratingMainColor4,
          main5: AppColors.ratingMainColor5,
          second1: AppColors.ratingSecondColor1,
          second2: AppColors.ratingSecondColor2,
          second3: AppColors.ratingSecondColor3,
          second4: AppColors.ratingSecondColor4,
          second5: AppColors.ratingSecondColor5,
        )
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
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // <-- Radius
          ),
        ),
        backgroundColor: const MaterialStatePropertyAll(AppColors.primaryColor),
        overlayColor: const MaterialStatePropertyAll(AppColors.highlightColor),
            surfaceTintColor: const MaterialStatePropertyAll(AppColors.highlightColor),
      )),
      textTheme: const TextTheme(
          titleSmall: TextStyle(
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
          titleMedium: TextStyle(
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w500,
            fontSize: 25,
            height: 1.2,
          ),
          titleLarge: TextStyle(
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w600,
            fontSize: 36,
          ),
          headlineSmall: TextStyle(
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w500,
            fontSize: 18.2,
          ),
          bodySmall: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 18.2,
            height: 1.2,
            fontWeight: FontWeight.w400,
          )),
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
