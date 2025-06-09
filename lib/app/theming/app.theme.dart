import 'package:flutter/material.dart';
import 'package:privates/app/theming/app.fonts.dart';

part 'app.colors.dart';
part 'app.texttheme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: _AppColors.primaryLight,
      onPrimary: _AppColors.white,
      surface: Colors.white,
      onSurface: _AppColors.black,
    ),
    dividerColor: _AppColors.strokeColor,
    dividerTheme: const DividerThemeData(
      thickness: 1,
      color: _AppColors.strokeColor,
    ),
    fontFamily: AppFonts.manrope,
    textTheme: TextTheme(
      displaySmall: _AppTextTheme.displaySmall.copyWith(
        color: _AppColors.black,
        fontFamily: AppFonts.nunito,
      ),
      headlineLarge: _AppTextTheme.headline1.copyWith(
        color: _AppColors.black,
      ),
      headlineMedium: _AppTextTheme.headline2.copyWith(
        color: _AppColors.black,
      ),
      headlineSmall: _AppTextTheme.headline3.copyWith(
        color: _AppColors.black,
      ),
      titleLarge: _AppTextTheme.headline4.copyWith(
        color: _AppColors.black,
      ),
      titleMedium: _AppTextTheme.headline5.copyWith(
        color: _AppColors.black,
      ),
      titleSmall: _AppTextTheme.headline6.copyWith(
        color: _AppColors.black,
      ),
      bodyLarge: _AppTextTheme.bodyLargeBold.copyWith(
        color: _AppColors.black,
      ),
      bodyMedium: _AppTextTheme.bodyMediumBold.copyWith(
        color: _AppColors.black,
      ),
      bodySmall: _AppTextTheme.bodySmallBold.copyWith(
        color: _AppColors.black,
      ),
      labelLarge: _AppTextTheme.bodyXLargeBold.copyWith(
        color: _AppColors.black,
      ),
      labelSmall: _AppTextTheme.bodyXSmallBold.copyWith(
        color: _AppColors.black,
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
