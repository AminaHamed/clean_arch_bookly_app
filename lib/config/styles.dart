import 'package:clean_arch_bookly_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../core/utils/constants.dart';

abstract class Styles {
  static const textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );
  static const textStyle30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w900,
    fontFamily: kGtSectraFine,
    letterSpacing: 1.2,
  );
  static final textStyle14 = TextStyle(
      fontSize: 14, fontWeight: FontWeight.normal, color: AppColors.green);

  static const textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}
