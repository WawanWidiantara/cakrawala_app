import 'package:cakrawala_app/app/core/constants/colors.dart';
import 'package:flutter/material.dart';

InputDecoration formStyle() {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      filled: true,
      fillColor: AppColors.formFill,
      focusColor: AppColors.formStroke,
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.error),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.error),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.formStroke, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.formStroke, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }