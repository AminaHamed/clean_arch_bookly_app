import 'package:clean_arch_bookly_app/core/translation_helper/app_localizations.dart';
import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({Key? key, required this.animation}) : super(key: key);
  final Animation<Offset> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, _) {
          return SlideTransition(
            position: animation,
            child: Text("splashText".tr(context)),
          );
        });
  }
}
