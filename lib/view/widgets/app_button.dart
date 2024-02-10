import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_lottie.dart';
import 'package:ecommerce_app/core/extensions/context.dart';
import 'package:ecommerce_app/core/extensions/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth * 0.9,
      height: context.screenHeight * 0.05,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 3,
          backgroundColor: AppColors.redColor,
        ),
        onPressed: onPressed,
        child: isLoading
            ? Center(
                child: SizedBox(
                  width: 40,
                  child: Lottie.asset(
                    AppLottie.loadingLottie,
                    repeat: true,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : Text(
                label,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: 14.toFont,
                  fontWeight: FontWeight.w500,
                  color: AppColors.whiteColor,
                ),
              ),
      ),
    );
  }
}
