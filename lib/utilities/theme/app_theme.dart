import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/extensions/context.dart';
import 'package:flutter/material.dart';

ThemeData appTheme(BuildContext context) {
  return ThemeData(
    colorSchemeSeed: AppColors.seedColor,
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: context.textTheme.labelLarge?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2),
        borderSide: const BorderSide(
          color: AppColors.greyColor,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2),
        borderSide: const BorderSide(
          color: AppColors.greyColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2),
        borderSide: const BorderSide(
          color: AppColors.redColor,
        ),
      ),
    ),
  );
}
