import 'package:flutter/material.dart';

import '../../config/styles.dart';
import '../app_colors.dart';
import '../app_strings.dart';

SnackBar showCustomSnakeBar(String msg) {
  return SnackBar(
    backgroundColor: AppColors.orange,
    content: Text("${AppStrings.booksPaginationFailure}:$msg,",
        style: Styles.textStyle16),
    duration: const Duration(seconds: 2),
  );
}
