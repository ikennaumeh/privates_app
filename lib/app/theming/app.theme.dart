import 'package:flutter/material.dart';

part 'app.colors.dart';
part 'app.texttheme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: _AppColors.primaryLight,
      onPrimary: _AppColors.white,
    ),
    primaryColor: _AppColors.primaryLight,
    fontFamily: "Manrope",
    textTheme: TextTheme(
      headlineLarge: _AppTextTheme.headline1.copyWith(
        color: _AppColors.greyscale900,
      ),
      headlineMedium: _AppTextTheme.headline2.copyWith(
        color: _AppColors.greyscale900,
      ),
      headlineSmall: _AppTextTheme.headline3.copyWith(
        color: _AppColors.greyscale900,
      ),
      titleLarge: _AppTextTheme.headline4.copyWith(
        color: _AppColors.greyscale900,
      ),
      titleMedium: _AppTextTheme.headline5.copyWith(
        color: _AppColors.greyscale900,
      ),
      titleSmall: _AppTextTheme.headline6.copyWith(
        color: _AppColors.greyscale900,
      ),
      bodyLarge: _AppTextTheme.bodyLargeBold.copyWith(
        color: _AppColors.greyscale900,
      ),
      bodyMedium: _AppTextTheme.bodyMediumBold.copyWith(
        color: _AppColors.greyscale900,
      ),
      bodySmall: _AppTextTheme.bodySmallBold.copyWith(
        color: _AppColors.greyscale900,
      ),
      labelLarge: _AppTextTheme.bodyXLargeBold.copyWith(
        color: _AppColors.greyscale900,
      ),
      labelSmall: _AppTextTheme.bodyXSmallBold.copyWith(
        color: _AppColors.greyscale900,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        textStyle: _AppTextTheme.bodyXLargeBold.copyWith(
          color: _AppColors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
