import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/utils/app_colors.dart';

ThemeData myTheme() {
  return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppColors.kPrimaryColor,
      textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme));
}
