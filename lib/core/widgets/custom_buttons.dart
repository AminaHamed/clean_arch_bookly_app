import 'package:flutter/material.dart';

import '../config/styles.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
      required this.onPressed,
      this.fontSize,
      this.textColor,
      this.borderRadius,
      required this.text,
      required this.backgroundColor})
      : super(key: key);
  final void Function()? onPressed;
  double? fontSize;
  Color? textColor;
  BorderRadiusGeometry? borderRadius;
  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius ??
                    BorderRadius.circular(
                      12,
                    ),
              )),
          child: Text(
            text,
            style: Styles.textStyle18.copyWith(
              color: textColor,
              fontWeight: FontWeight.w900,
              fontSize: fontSize,
            ),
          )),
    );
  }
}
